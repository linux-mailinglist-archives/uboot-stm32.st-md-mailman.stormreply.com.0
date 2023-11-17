Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B5F7EF3C6
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Nov 2023 14:42:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDBE7C6C85E;
	Fri, 17 Nov 2023 13:42:24 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 028FCC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 13:42:22 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-66d0ceba445so10926886d6.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 05:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1700228542; x=1700833342;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CwpSEwEOllI6LcYna/uH5XoLf8aB0NQ1HjeNtDeZ/+s=;
 b=opo5KHlQ5/mzbEH5tghWnYaZ3zFs7lBgGXAKBBIrvRQWjE72MchIUV64hFruhINSz4
 vN071fnvzwn+sOzs5D0fQn4Lg1TG2GR0xoUchPzyWtzmwVFwa3HfM9w2REKY6JicC/i2
 lMzfrPceau0hK9FOvWJzP0jfWAZQmriDpoHqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700228542; x=1700833342;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CwpSEwEOllI6LcYna/uH5XoLf8aB0NQ1HjeNtDeZ/+s=;
 b=DW4FGDUoxRxI7e2wFUMeJfnWn8q/uEagBN5O8zZxH3+tbafso3uY8xQQaXVcNlg/7R
 uGSyx7DmUor2gGgm9GIRnt6ypc2KMgr6fzrjPRmhQAHU7JWgk2SP+U0F4S3dzHu/oOUi
 fb8kNKSby7W+hV/cgwD0gUlt/XJH4Jp1M+RMl+UCd1rZG+CRQehrkEvaO+EupY8DRXrD
 rfSaa0FvfwHOwN6WTFRFgVtnvxFyCBXLt6qPgXOzmhTVfvIUwizWu7DOfGZ9H6eFb+0D
 XlFkkuIFzkqRvMRCO/xpAXAPSOQnmNmSw5Ra3QY3ogzf0iiOwyhjfK81+D5NpP9rze38
 9A5g==
X-Gm-Message-State: AOJu0YyTqObwe/QV5LgRMXwQAM2SxZ1vEjlMtfeqIe/2Pp81Lio70ntE
 R9cfcPOSHpw2ols5u75RCw3QAA==
X-Google-Smtp-Source: AGHT+IG8bs097idczyBjCQcx/JPWWKqKMp2vgvsDKMWNFO0nsL7TxnHfcJXLkkJDFppCHML52hvGjQ==
X-Received: by 2002:ad4:5ced:0:b0:66d:1ffe:bcd4 with SMTP id
 iv13-20020ad45ced000000b0066d1ffebcd4mr15239232qvb.44.1700228541027; 
 Fri, 17 Nov 2023 05:42:21 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-a78f-80e1-dc58-f720.res6.spectrum.com.
 [2603:6081:7b00:6400:a78f:80e1:dc58:f720])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a0cee68000000b0065afbb39b2dsm636295qvs.47.2023.11.17.05.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 05:42:20 -0800 (PST)
Date: Fri, 17 Nov 2023 08:42:17 -0500
From: Tom Rini <trini@konsulko.com>
To: Igor Prusov <ivprusov@salutedevices.com>
Message-ID: <20231117134217.GW170968@bill-the-cat>
References: <20231109171004.193521-1-ivprusov@salutedevices.com>
 <20231109171004.193521-2-ivprusov@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20231109171004.193521-2-ivprusov@salutedevices.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Baruch Siach <baruch@tkos.co.il>, Kever Yang <kever.yang@rock-chips.com>,
 Sean Anderson <seanga2@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Peng Fan <peng.fan@nxp.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, prusovigor@gmail.com,
 Marek Vasut <marex@denx.de>, Stefan Roese <sr@denx.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot-amlogic@groups.io, Jaehoon Chung <jh80.chung@samsung.com>,
 Joel Stanley <joel@jms.id.au>, Heiko Schocher <hs@denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>, kernel@sberdevices.ru,
 Bhupesh Sharma <bhupesh.linux@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Neha Malcom Francis <n-francis@ti.com>,
 Alexander Dahl <ada@thorsis.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Balaji Prakash J <bjagadee@codeaurora.org>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 3/3] treewide: use linux/time.h for time
 conversion defines
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
Content-Type: multipart/mixed; boundary="===============9027361254858367763=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============9027361254858367763==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Gqn10LtVtC4MbKp"
Content-Disposition: inline


--8Gqn10LtVtC4MbKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 08:10:04PM +0300, Igor Prusov wrote:

> Now that we have time conversion defines from in time.h there is no need
> for each driver to define their own version.
>=20
> Signed-off-by: Igor Prusov <ivprusov@salutedevices.com>
> Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com> # tegra
> Reviewed-by: Eugen Hristev <eugen.hristev@collabora.com> #at91
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org> #qcom geni
> Reviewed-by: Stefan Bosch <stefan_b@posteo.net> #nanopi2
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--8Gqn10LtVtC4MbKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmVXbbkACgkQFHw5/5Y0
tyzjMQwAs4rUe7sR2Krrdo8v0Y+HdHSbxhMrLe/+H98rOzQKwJgzI5zqQJ4lVqmQ
gxf3X+4TOHshwxet0N94fLbTFIZ8ly1cWHDU6O6H+rb+SzZVtL+s+YhCkIA9u4qO
BYCzr2CjevSy17JFYSA1yrv/MSU7FiX1bW2U/PHczFtSIyzJ7ZDZDKr0GsEw5gyr
2WX/CD/fnBAERbQi9VFeAe0ZkvhM3LkwhdaAaaR1h2TRmWdFpXtkhIxqJ8cHgjp0
ejfzMtigPROA7Ca3wyJAijLU0MvIJ/iJVQz4Auig+1PvEFaYhwxqgh9dT3fgDUOe
Ck/AnfXJBjuf6drrvE9eRFmOzvxZMsPHDR7QzpeSjcoIW4nOjNuMNjTfP3IDim93
wi3UiSTj6u5TDC9hg/gVlK1/RAm0AkS86I7cqx+GNwbyMqMFQYkWiJPRxUMMoBo5
MyJHyiyc2d+K6rzEUsCgpHCTiVxPIKnKrIdrgzvhXic3XOHGMMTPiBJWZTxOVk9J
fuaNI41E
=adIm
-----END PGP SIGNATURE-----

--8Gqn10LtVtC4MbKp--

--===============9027361254858367763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============9027361254858367763==--
