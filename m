Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC0627F162
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Sep 2020 20:35:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 701E5C36B37;
	Wed, 30 Sep 2020 18:35:53 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8221C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 18:35:51 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id r8so2040065qtp.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DcDWjW/+8kg7vZcw9fTOtWuuIYZBJaeXDW+fonf4FYo=;
 b=IrDZxCE945vbte4CBednSmOEzRtgjhtGg9zjlVG/5/ds7cPadAL9/UQjpzS6Lq3zmR
 nOpvRDS6eRpA/sRh7Zd5guxmVB5Nk5VmyPyjnS3yiRpszat/Cy6MBRytB5zkIORLH/EG
 TG/TBnH0C9yvsclAMi/IJSU5YljbFhchJiAzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DcDWjW/+8kg7vZcw9fTOtWuuIYZBJaeXDW+fonf4FYo=;
 b=KE07/0LkVRzjel8zT726BwGBdR5oG7ov38Vd+zi6cS2amtYJT/YQWkjOULPrAyzKpd
 kERX5PCk61Yb3SWYe3+QoiG9LgbOUxrvaJ9ctMaPt27y0ZvXXVTAwST9maKxh5wqTb6a
 3OHatXZECR5/fcTufdU24WimuJgRcB9G8vqsFVL+iZzxkk3Yh7Iut+RFuqvMky8Fi0OP
 Ddf0r9EorHT6+LDFTc7GYQ1xsgaG12xbtDiMyc1lab5XHT3M7s3TAS5MOD5ePWiGMlW7
 8Bz7ljktbVKWH1W4dP4d4+CxsmeoCjoBKPRiPtFHKQqlC6FwMk0gqBhh0NtPAQgDmeV6
 0Aow==
X-Gm-Message-State: AOAM533mDwrUTzp6v2+cRHGdyIet1sVRl6D9Xcp43YEroCjC194c0uy8
 Jd9ThO15pl4hm5f0QbCbegdN1Q==
X-Google-Smtp-Source: ABdhPJy+Bs2tJM8zY8Cnm2RHN+Pb0bjspRrtt3Si9Oie89vtY0elxb6QFvJy9TKSPTvbf5vHBW0Maw==
X-Received: by 2002:ac8:498d:: with SMTP id f13mr3756655qtq.35.1601490949881; 
 Wed, 30 Sep 2020 11:35:49 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-3025-afbb-b50b-bf4a.inf6.spectrum.com.
 [2606:a000:1401:8ebe:3025:afbb:b50b:bf4a])
 by smtp.gmail.com with ESMTPSA id p3sm2960601qkj.113.2020.09.30.11.35.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Sep 2020 11:35:48 -0700 (PDT)
Date: Wed, 30 Sep 2020 14:35:45 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200930183545.GI14816@bill-the-cat>
References: <20200605092244.1.I773bf523d9f4d1a6212483d030e34113b832a779@changeid>
MIME-Version: 1.0
In-Reply-To: <20200605092244.1.I773bf523d9f4d1a6212483d030e34113b832a779@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: u-boot@lists.denx.de, Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Joe Hershberger <joe.hershberger@ni.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] optee: copy FDT OP-TEE related nodes
 before generic FDT changes
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
Content-Type: multipart/mixed; boundary="===============1290589938240042745=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1290589938240042745==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yqH4HOlpOrgjBzwY"
Content-Disposition: inline


--yqH4HOlpOrgjBzwY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2020 at 09:22:54AM +0200, Patrick Delaunay wrote:

> From: Etienne Carriere <etienne.carriere@linaro.org>
>=20
> Move call to optee_copy_fdt_nodes() introduced by [1] before generic
> changes in kernel FDT so that platform specific changes are not
> overridden by the changes made by this function.
>=20
> Link: [1] commit 6ccb05eae01b ("image: fdt: copy possible optee nodes to =
a loaded devicetree")
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

With a slight reword to uses a Fixes tag:

Applied to u-boot/master, thanks!

--=20
Tom

--yqH4HOlpOrgjBzwY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl90z/4ACgkQFHw5/5Y0
tyyUfgv+N64Ccnd0nM+41uDWVxuYAH7GI0K+z4AOnqn+MFWuGP7RH6z1i2WjnUnS
TSnLIbcE4/m6AY2meam6fpX67rtZy2FQXSxszgzbFT1aEYatjgt5jpoIQIFhlwsh
DzNWT09BOyCN1vKszqYpXhf+Cje/WLzzHkdn6/4CAEIRJBzyu2Lupcws52Apj/Sb
TafvoZNW9R2erFz0NAsySeXMtgRHVs/jeFO/R9GCID6V+MPhJ2z7mgUPZYcYtdfO
+2CmHmh8igyGfRUaP4inn0jLXXIfUByPPV+h5IaieQe1bDQyyf3NPup6Gad+JSGo
dtSJuS4btKeWvBCnCHvzvdNQUdOqqkfhExcuAkav/+viZPS3YoSN6NcNlTPN4YDq
uHsxMvW0efk/Irs5EGL5SsPNLR9BXp3whc5bojS1X2hnkosr1GYBc5209KwdO62x
3eXqeJ91HtVi4bCvKBaRqh5UiF8qaD2X1UQdVaaDGgYsZjZx7bIXn8z7FSuRAqRT
d+HnjDgc
=7KuZ
-----END PGP SIGNATURE-----

--yqH4HOlpOrgjBzwY--

--===============1290589938240042745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1290589938240042745==--
