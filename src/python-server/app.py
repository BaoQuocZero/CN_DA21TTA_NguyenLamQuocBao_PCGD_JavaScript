from flask import Flask, jsonify, request
from flask_cors import CORS
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder
import traceback

app = Flask(__name__)
CORS(app)  # Kích hoạt CORS cho tất cả các route

# Định nghĩa một route đơn giản
@app.route('/', methods=['GET'])
def chao():
    return jsonify(message="Xin chào!")

@app.route('/api/hello', methods=['GET'])
def hello():
    return jsonify(message="Python đang sống tốt ...!")

@app.route('/api/randomforest', methods=['POST'])
def random_forest_predict():
    try:
        # Lấy dữ liệu từ request
        data = request.get_json()
        data_training = data.get('data_training', [])
        data_auto_phan_cong = data.get('data_auto_phan_cong', [])
        data_gv = data.get('data_gv', [])

        if not data_training or not data_auto_phan_cong or not data_gv:
            return jsonify({
                "EM": "Thiếu dữ liệu đầu vào",
                "EC": -1,
                "DT": []
            }), 400

        # Chuyển dữ liệu thành DataFrame
        df_train = pd.DataFrame(data_training)
        df_predict = pd.DataFrame(data_auto_phan_cong)
        df_gv = pd.DataFrame(data_gv)

        # Kiểm tra các cột cần thiết
        required_columns = ['MAGV', 'MAMONHOC']
        for col in required_columns:
            if col not in df_train.columns:
                return jsonify({
                    "EM": f"Thiếu cột {col} trong data_training",
                    "EC": -1,
                    "DT": []
                }), 400

        # Xử lý dữ liệu huấn luyện
        X_train = df_train[['MAMONHOC']]
        y_train = df_train['MAGV']

        # Xử lý dữ liệu dự đoán
        X_predict = df_predict[['MAMONHOC']]

        # Encode các biến phân loại
        le_MAMONHOC = LabelEncoder()
        le_MAGV = LabelEncoder()

        # Fit và transform trên dữ liệu huấn luyện
        X_train.loc[:, 'MAMONHOC'] = le_MAMONHOC.fit_transform(X_train['MAMONHOC'])
        y_train_encoded = le_MAGV.fit_transform(y_train)

        # Kiểm tra các giá trị chưa thấy trong X_predict
        unseen_mamonhoc = set(X_predict['MAMONHOC']) - set(le_MAMONHOC.classes_)
        if unseen_mamonhoc:
            print("Có giá trị MAMONHOC chưa thấy:", unseen_mamonhoc)
            # Có thể quyết định xử lý tại đây

        # Transform dữ liệu dự đoán
        X_predict.loc[:, 'MAMONHOC'] = le_MAMONHOC.transform(X_predict['MAMONHOC'])

        # Xây dựng mô hình Random Forest
        clf = RandomForestClassifier(n_estimators=100, random_state=42)
        clf.fit(X_train, y_train_encoded)

        # Dự đoán
        y_pred_encoded = clf.predict(X_predict)
        y_pred = le_MAGV.inverse_transform(y_pred_encoded)

        # Lấy danh sách MAGV hợp lệ từ data_gv
        valid_magv = set(df_gv['MAGV'].unique())
        y_pred_filtered = [magv if magv in valid_magv else None for magv in y_pred]

        # Gán MAGV vào DataFrame dự đoán
        df_predict['MAGV'] = y_pred_filtered

        # Xử lý các trường hợp không hợp lệ (MAGV không trong data_gv)
        for index, row in df_predict.iterrows():
            if row['MAGV'] is None:
                df_predict.at[index, 'MAGV'] = df_gv.sample(1)['MAGV'].values[0]

        # Chuyển DataFrame dự đoán thành danh sách dict
        result = df_predict.to_dict(orient='records')

        return jsonify({
            "EM": "Success",
            "EC": 0,
            "DT": result
        })

    except Exception as e:
        print("Lỗi trong /api/randomforest:", e)
        traceback.print_exc()
        return jsonify({
            "EM": "Lỗi xử lý Random Forest",
            "EC": -1,
            "DT": []
        }), 500

# Chạy server
if __name__ == '__main__':
    app.run(debug=True)