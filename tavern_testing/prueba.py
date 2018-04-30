#!flask/bin/python
from flask import Flask, jsonify, make_response, request

app = Flask(__name__)



nombres = [
    {
        'nombre': u'nombre1' 

    }
]


@app.route('/cabesa', methods=['GET'])
def get_cabesa():
    return jsonify({'k dise illo': nombres}), 200


@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Not found'}), 404)





@app.route('/cabesa', methods=['POST'])
def create_cabesa():
    if not request.json or not 'nombre' in request.json:
        abort(400)
    nombre = {
        'nombre': request.json['nombre']
    }
    nombres.append(nombre)
    return jsonify({'nombres': nombres}), 201




if __name__ == '__main__':
    app.run(debug=True)
