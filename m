Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF34564772C
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Dec 2022 21:24:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F343C65E63;
	Thu,  8 Dec 2022 20:24:08 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF952C65E5D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 20:24:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id bx10so3090838wrb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Dec 2022 12:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YtqjhKxF1oISnLgVV7CJpFOuz+k8lFtG+TgfiQXrKcc=;
 b=O7Ey6xHxX0H9hMiOzoSqe5cl4Uh5ibLdVIErUhpoi1etNv8lQ/++/5BreLttNQGGDU
 Dvmqg8iuyG5MYvHsRD0tX24Ow9gutEYThLr74jx4+dE0YsgMxW3iLAa+r4DMSHighhKd
 KTyb1NhY1RloYHZAvpzgvYplnlL1To9ZmW0vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YtqjhKxF1oISnLgVV7CJpFOuz+k8lFtG+TgfiQXrKcc=;
 b=1ZB6b7eNuIJAduqx1X8wheu6KiQwjD2D8us4qc7+a6sFsYsF0glvLswnBaLsy+3jsh
 lxUXfnTJMv5GaQY7rUKfqOCjOnW3lB0em+n2dhpYUmVbwabgiyXFw7S7QAP61ODfMTEy
 eH387yUlg/dYeeqxvBaznkPDyMtN7kCoccJev8iY6G3CeCk8pJPOgC9x9BRMTruTwzyY
 0YHlcaZC0fqGCVfo/bM3UtA80NTLoKG0OEF3gBrR4ci3NfWeexxasUWxN4InqKqJf+fI
 bG7ryMFdmDNGifEP9aZwKuV/VXD0xdqCcCAH5b6DqPByBvShoK9CqrHJIg4erwg2/RvP
 lIRA==
X-Gm-Message-State: ANoB5pmtyyodFmak2VF5vNOIwiOCAykiAeqWxw6rP1XfVYFTbxbN/zzK
 4KUiyBo5u+4qZqKFLJrfBwSZ5g==
X-Google-Smtp-Source: AA0mqf5L4wnh/Vwucak7qQg4xKXsCXetkQOS9QZ6hABlOrsu1EWw8Nmroj+G36k5xkGbwpFMHumvRw==
X-Received: by 2002:adf:ed05:0:b0:242:1ea7:2bbb with SMTP id
 a5-20020adfed05000000b002421ea72bbbmr2216490wro.27.1670531046216; 
 Thu, 08 Dec 2022 12:24:06 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-0511-db36-5a97-af74.res6.spectrum.com.
 [2603:6081:7b00:6400:511:db36:5a97:af74])
 by smtp.gmail.com with ESMTPSA id
 t12-20020adfeb8c000000b0023662245d3csm22855832wrn.95.2022.12.08.12.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 12:24:05 -0800 (PST)
Date: Thu, 8 Dec 2022 15:24:02 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20221208202402.GM3787616@bill-the-cat>
References: <20221125125600.1.I04ba2df902dce6162fd1cc11153417c1935d0ea9@changeid>
MIME-Version: 1.0
In-Reply-To: <20221125125600.1.I04ba2df902dce6162fd1cc11153417c1935d0ea9@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Etienne CARRIERE <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] firmware: scmi: use protocol node name to
 bind the scmi regulator driver
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
Content-Type: multipart/mixed; boundary="===============2966139128189343406=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2966139128189343406==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlO3cJeIUypwojD8"
Content-Disposition: inline


--qlO3cJeIUypwojD8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2022 at 12:56:29PM +0100, Patrick Delaunay wrote:

> In scmi firmware driver, it is better to bind the scmi protocol driver
> "scmi_voltage_domain" with the node name of the protocol 17 and not
> the sub-node named "regulator", because is a fixed string which doesn't
> provide information and because it is not aligned with the other scmi
> protocol nodes.
>=20
> For example on stm32mp135f-dk board with device tree in stm32mp131.dtsi
>=20
> scmi: scmi {
> 	compatible =3D "linaro,scmi-optee";
> 	#address-cells =3D <1>;
> 	#size-cells =3D <0>;
> 	linaro,optee-channel-id =3D <0>;
> 	shmem =3D <&scmi_shm>;
> 	scmi_clk: protocol@14 {
> 		reg =3D <0x14>;
> 		#clock-cells =3D <1>;
> 	};
> 	scmi_reset: protocol@16 {
> 		reg =3D <0x16>;
> 		#reset-cells =3D <1>;
> 	};
> 	scmi_voltd: protocol@17 {
> 		reg =3D <0x17>;
> 		scmi_regu: regulators {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
> 			scmi_reg11: voltd-reg11 {
> 				reg =3D <VOLTD_SCMI_REG11>;
> 				regulator-name =3D "reg11";
> 			};
> 			scmi_reg18: voltd-reg18 {
> 				reg =3D <VOLTD_SCMI_REG18>;
> 				regulator-name =3D "reg18";
> 			};
> 			scmi_usb33: voltd-usb33 {
> 				reg =3D <VOLTD_SCMI_USB33>;
> 				regulator-name =3D "usb33";
> 			};
> 		};
> 	};
> };
>=20
> Before the patch:
>=20
> > dm tree
>=20
>  scmi_agent    0  [ + ]   scmi-over-optee       |-- scmi
>  clk           1  [ + ]   scmi_clk              |   |-- protocol@14
>  ...
>  reset         1  [   ]   scmi_reset_domain     |   |-- protocol@16
>  nop           2  [ + ]   scmi_voltage_domain   |   `-- regulators
>  regulator     0  [ + ]   scmi_regulator        |       |-- voltd-reg11
>  regulator     1  [ + ]   scmi_regulator        |       |-- voltd-reg18
>  regulator     2  [ + ]   scmi_regulator        |       |-- voltd-usb33
>  ...
>=20
> after the patch:
>=20
> > dm tree
>=20
>  scmi_agent    0  [ + ]   scmi-over-optee       |-- scmi
>  clk           1  [ + ]   scmi_clk              |   |-- protocol@14
>  ...
>  reset         1  [   ]   scmi_reset_domain     |   |-- protocol@16
>  nop           2  [ + ]   scmi_voltage_domain   |   `-- protocol@17
>  regulator     0  [ + ]   scmi_regulator        |       |-- voltd-reg11
>  regulator     1  [ + ]   scmi_regulator        |       |-- voltd-reg18
>  regulator     2  [ + ]   scmi_regulator        |       |-- voltd-usb33
>  ...
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--qlO3cJeIUypwojD8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmOSR+IACgkQFHw5/5Y0
tyx2HQwAjIC0zfqIxkXLcU87wMooOXr+r1NPhDu+l9m/kIwAMqjPhLjN6E6kaia/
esa8oA3BX63uvDowxrd+fioFhEilYUah7csaeWYxsjF0JwDVVs8AOIQTuYLb7ryD
ZlGVh9r4c/2bPcBBi3tgPETnJOyxvmfTlzlSLzpv/90E4TDHZLrBSQ2wjGYGdRmJ
lN2ZLqNk3HDoCf7NONpYeJ2hFvKMNBQNQ9Dug+hwu5yrnI42YkpO87a2p+t98Ke0
bhNRpmjBNnXo6mTQcJn6lFFZ8m1xh9isHCzxON/N6PuZ+9SX+46pxyqqxz45hC0l
yMDkGQQHoCh/KgmxJRI2HFtBCPmfTfwQ6UTaIThJM5pkctjewMwwQEVH58XDktA3
3MO+DoHtzsUP14WQRi9MHe0OOAvvOcxDEZx3aCHkpAGJHvuiCmQ4z++DrlRPXYkJ
ZUirjDsKc2rHcQxbwAummCQgaGSbUaJx5FWq20+yIAwVfAIX524vQSTsvK0ht17r
EMmPMott
=kACb
-----END PGP SIGNATURE-----

--qlO3cJeIUypwojD8--

--===============2966139128189343406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2966139128189343406==--
