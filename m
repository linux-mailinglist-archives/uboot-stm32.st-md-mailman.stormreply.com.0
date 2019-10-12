Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8603D5261
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Oct 2019 22:23:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60F83C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Oct 2019 20:23:02 +0000 (UTC)
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7D14C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Oct 2019 20:23:00 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id r134so4766948ywg.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Oct 2019 13:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0haeeA6rNi2Qz/DlN0JllAjCjnK+TzZwqkBvhuspNec=;
 b=Vsjhqiv2m9vGF7YpVqpJ1GA1vvmdKHN9f5xV2iOUmF/P7ffn0c2INT+ozqk9RnAh7f
 u0FvAtkDP8btpHvVKd3zcu1cWAN6KoaTDX6mqGw0B+38B9STLydJydzjvhRtFZo/qF+p
 w7iJiTFC5XtrLQatYXjEySCCUA4607hrcyZ08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0haeeA6rNi2Qz/DlN0JllAjCjnK+TzZwqkBvhuspNec=;
 b=Fyz3JZsc/D6Y4puC2lvjfL0NzGaPjB4qgtoAjNM6N7G/iR9gc1RevrjEVbeTs2KxrO
 zzl6D4WRxx+A2bVkRdGpWpN7UXLpuakf2cbHLUVqK8aJiJraqF4lovNjW4P9yz4PPGnX
 653Um3ScPGFgUsLXRHCIGhAQwiLYvEAyaDCyR+UXf15zC9SZ5XKaPq1cqPJxkKfuPqdl
 QA0+md5OiRpir/GD5hURjV4WRW1AYrruqbIF7Yp7OHa/9k0tKKVjFZI+hhyV51MillTd
 InKYM0ugZiyWWl02TaX/hRWRu1IOi9ryMhBd/QT2T8nnQprYa/EkBpimMgww1bnsTlTg
 TzZw==
X-Gm-Message-State: APjAAAVwTYZ1IZPLySFw+KMQtdMs2KYxkLjf7Mh97fO9fsJIJwKK49Md
 rupvIwPE0nkxosukzSfI0PTBHg==
X-Google-Smtp-Source: APXvYqzNcdn2mOx6CX7QnnUsrhBRh19gC7RBeSjYyR6vprN66xgbyI/hyMsn0VjCGkoIxOB2ygA3Nw==
X-Received: by 2002:a81:5e43:: with SMTP id s64mr7410926ywb.225.1570911779693; 
 Sat, 12 Oct 2019 13:22:59 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id w8sm3099132ywc.20.2019.10.12.13.22.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 12 Oct 2019 13:22:58 -0700 (PDT)
Date: Sat, 12 Oct 2019 16:22:56 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20191012202256.GX16029@bill-the-cat>
References: <20190826115031.25099-1-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20190826115031.25099-1-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2] regulator: fixed: Modify
 enable-active-high behavior
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2775602921157863295=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2775602921157863295==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R9dSeJxMIUBTi9Do"
Content-Disposition: inline


--R9dSeJxMIUBTi9Do
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2019 at 01:50:31PM +0200, Patrice Chotard wrote:

> Regulator should not be enabled at probe time if regulator-boot-on
> property is not in the dt node.
>=20
> "enable-active-high" property is only used to indicate the GPIO
> polarity.
>=20
> See kernel documentation :
>  - Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
>  - Documentation/devicetree/bindings/regulator/gpio-regulator.yaml
>=20
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--R9dSeJxMIUBTi9Do
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl2iNiAACgkQh/n2NdMd
dlKhEA/+N2X6CRMg9ODBujSYbtMAf6KDzgvLW1IiUakkf+eUe93fNIIePzTlcSPB
PImgyW1aBp70sbFr7S0xcGjh2iMnbGsoaksPS4+jltdiPRanPsBxmjqVUBGiq11X
GiDon29184nV4xigQUJMV2wO/aHOiO7e6jZpr5wpt2s8I/fbOATxvvqPJPyl+VAH
pwuLlEB3kT2UTBMDlc/eTWp6hvRnhZUbdK+Hq7olHYk2gV6ordgAfioY8iAvXOjv
XHeIGMWMG1h5vQRhYAzz+5C4txsMuVEWYOzW2zj3GjRoYXBEMg1frdJFFyLlR22S
IjRPXt6rZ0z8m0bi+0CYueCH1TVY5S4D4aENaSEOYuLpa2Ok1SaJC7mSp+LuwN00
2cC/L0+lVEMCeFPpLfUz/UYTT59Fxjsh0AbYbCSOGT3PZO6zdTfw4gCOrlfEZJ8g
Ob59pKLiq7FrYm+OaSg7HDpcQqbM9vnG6TgDZlcGh0HDT90h9naRQcrhOtfQqXMY
CIAx1in1fgVG1rmkydklNMV6pJMg7mW2fd4NoEgq9xnhuHsM0qRSH6fA6q/PpT4O
vrJjJYxT++7hK0SiARq4wInoCwqa7l6G09t9bJveyKrlQfKlQyO1i/Qvkk3N5ZVy
EXE2dNeHBTGrBp8wXIVgYyjiMYk0azUgnjfJp3JDQQqFFVBjjHg=
=SXs5
-----END PGP SIGNATURE-----

--R9dSeJxMIUBTi9Do--

--===============2775602921157863295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2775602921157863295==--
