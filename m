Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB3D49656A
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jan 2022 20:03:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 838F6C5F1EC;
	Fri, 21 Jan 2022 19:03:15 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC74DC5F1EB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 19:03:13 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id h16so11461213qvk.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 11:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NleL6wL88/euQ30CNINMBM5/+lQ8ZjV4FssSfRHHeSo=;
 b=GQ4JuGJiePZV5gjjWQ1s2FZiJwBwgZzNyRMBZw3S3uhuFYb5HczRMF+vs8hIkUcR1/
 ZfdLTk3uNcVpS5oeuGcaA+a5e1bTaGZLpv9McEfAVKdianwhk9WXRJgKCIFqTRPO15UL
 4O1LahpSUALxApu5jmJ7USAZVVYST3RYyWDpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NleL6wL88/euQ30CNINMBM5/+lQ8ZjV4FssSfRHHeSo=;
 b=vUsbhtDRd+cP8+GSuO2KqVzvnNdbjiAKZE31Bz19FEw3y9hI2p1TfEqawMtAse+Aq+
 uOX3DiFklzb3Z1z64s43cGB13NszilypMtsDW517R2gL85MJNk/6jbwpFnFdsZ+nLL9s
 anNPFg5uERvvW0+p2j8sZhyHPiA1HWr1fk2lW7bWJmnZeft456gxRRS4r5oxTnY4HQhS
 SQPyhs13CKdxM0za0i+EisQiN3BryWTnmZUFjpk1WXOOdTnzB41OLbhTCVgZJ4WjFx/E
 TwzrT0Z5IuoS3uvcnjvy5MyJcjV10SdzRLGP4mo7mHAP3N7WID833FFtRBZ7jdwdmE9y
 rfWw==
X-Gm-Message-State: AOAM531aewYjKV1zGUrVrb00sg/J9ENe+fNrG5tTdyqurgMO76fkfSAN
 VLFDasv0qBFuOhCxQX0OsknWTg==
X-Google-Smtp-Source: ABdhPJwxgBLyMOUT7mp8KqcJQvvI7UWAF6jGLHyK90NKIwpLDrit+znCAQYtMl74KvENoXPxcfspKw==
X-Received: by 2002:a05:6214:c64:: with SMTP id
 t4mr5039072qvj.60.1642791792862; 
 Fri, 21 Jan 2022 11:03:12 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id t10sm3513976qtx.12.2022.01.21.11.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 11:03:12 -0800 (PST)
Date: Fri, 21 Jan 2022 14:03:10 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220121190310.GJ7004@bill-the-cat>
References: <20220104132401.3573475-1-patrick.delaunay@foss.st.com>
 <20220104142328.v1.3.Ie095df1d92aa81e8fc78fd288df631790d5666cb@changeid>
MIME-Version: 1.0
In-Reply-To: <20220104142328.v1.3.Ie095df1d92aa81e8fc78fd288df631790d5666cb@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Rick Chen <rick@andestech.com>,
 u-boot@lists.denx.de, Paul Burton <paul.burton@mips.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Andes <uboot@andestech.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v1 3/5] mtd: cfi: change
 CONFIG_SYS_MAX_FLASH_BANKS_DETECT as boolean
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
Content-Type: multipart/mixed; boundary="===============1890051882112364438=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1890051882112364438==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EUYUPHVNfBVWjsvu"
Content-Disposition: inline


--EUYUPHVNfBVWjsvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 04, 2022 at 02:23:59PM +0100, Patrick Delaunay wrote:

> Prepare migration to Kconfig.
>=20
> CONFIG_SYS_MAX_FLASH_BANKS_DETECT becomes boolean and
> CONFIG_SYS_MAX_FLASH_BANKS define the MAX size, also used
> for detection when CONFIG_SYS_MAX_FLASH_BANKS_DETECT=3Dy
> (CFI_MAX_FLASH_BANKS =3D CONFIG_SYS_MAX_FLASH_BANKS).
>=20
> CONFIG_SYS_MAX_FLASH_BANKS become mandatory when
> CONFIG_SYS_MAX_FLASH_BANKS_DETECT is activated.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Stefan Roese <sr@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--EUYUPHVNfBVWjsvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmHrA20ACgkQFHw5/5Y0
tywTfAv+Kewg4YVOn/LCp2PBW0m5SFkIRbHO2C9XBwVndZDax+6G1oIIbsAqziv3
t2+8YkSmMs+QUuL99gkuMEELPQg05wwcHsNHDQ5mmzxeBxsCw0Zfc7I7+CFFjL5w
qLu2T9ttT7r+xm0tdKoOLWcUQG/IQFavrOsbx5jbc5dZrAUCxxeLWfgcCpDc8Qq+
rftO0rnlJ69cg/lwXeW8DDCbSejC6HHFuIoa3FR49JKapKoKippR+V/GqHvvjO7m
JIg7Xsi7eocLdzeDIIQpcKjx8lkPSCoUCVnc+badzjXqLUa9jsBk5WC7m1rYR51V
Us9ONZrAPU8NmWj1wJt0CdrtcSFKAYqu5fE+dPNfxqUnSDZHc0hcEX4yNK24fYAA
9N7meG/IFDqDTSLzHoNNl/sFLFnjgAU1DklPN9k2sziOTGV5Z423PufdNSqEmhlc
K/N3yPQh7nDPUBON1qN3Hd4J9+798iqblh2et8T4vc+EeRH0W/rvqu8tCqg+s1ye
FxV9LUlG
=A04L
-----END PGP SIGNATURE-----

--EUYUPHVNfBVWjsvu--

--===============1890051882112364438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1890051882112364438==--
