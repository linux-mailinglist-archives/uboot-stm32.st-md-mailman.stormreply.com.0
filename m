Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7355E32BA22
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Mar 2021 20:09:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3976DC57B62;
	Wed,  3 Mar 2021 19:09:42 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E95B7C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 19:09:39 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id v3so18449786qtw.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 11:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MM/9hG3ZWeayV3u+4+6mkE3ZNMklfjlmrZTfFOb6Eb0=;
 b=U1GU89vIKAbaWy36AxRnfgoVYOtusFMnGWPVk57iNsqTzsDVMVHMuG4HW3D86dx7pr
 4JQDHhYoNDy3ihMOx4WU/lcYFAoRzGhduxGESPAL5RLsGdNS6mKb7soHuNQfax088lLL
 lMLsQ3s31VM6aLa6Y/xTa8UKS7HWmzgm3lSqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MM/9hG3ZWeayV3u+4+6mkE3ZNMklfjlmrZTfFOb6Eb0=;
 b=cDLIGVZ3ogB6GLfFWEWDQxbjdXu7ta35wyp6zqPWAO/K/PaqwfRTaAB5VZ9r2BDgt1
 uV6RQXgwHrC6LlNZ0VHOAknyPkT0I+bbXwF0l4GtetMz0KssoKzm19iiH31hvGUIU6Sd
 V0Fi7MPC/M5uBp5qYmSN4/+7JCb7nTGynkpvQa+Y9DMgJyXSrdKLjtHWJLbDXFj8Ojle
 DqPkgucCcl/z/xZ4X2OMI/SQSgT7JUw9hMWPZTMliX7Pe25UNLme/6yfn8RgSOJ/s9ls
 taHT5mFiCUI7XGbkUyPw8qFRrQRUFL0UYzYj4l/dl3SUG9q3PNWvd7zVuIPgl68EfVh7
 QOFw==
X-Gm-Message-State: AOAM533jlu2AQeDpWV6g47DxMBGwrAmfwYZiaRDU0hcgViFAsy7CF3Sc
 bgjlZpx2mw3hvWfTIk6aNlWIfA==
X-Google-Smtp-Source: ABdhPJypvoKkMWAOk5MJFKjG8BjimNB4b0ZnwD0Lw3M+zYEkYt8aepYvAba910D23dyxhXofNiOhAw==
X-Received: by 2002:ac8:1c6d:: with SMTP id j42mr665186qtk.264.1614798578971; 
 Wed, 03 Mar 2021 11:09:38 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-451a-3a99-8647-33ef.res6.spectrum.com.
 [2603:6081:7b07:927a:451a:3a99:8647:33ef])
 by smtp.gmail.com with ESMTPSA id z188sm14571074qke.85.2021.03.03.11.09.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Mar 2021 11:09:38 -0800 (PST)
Date: Wed, 3 Mar 2021 14:09:36 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210303190936.GU1310@bill-the-cat>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
 <20210205135332.8.I9e7089b60ce4ced76429882e8f19f549de7e11fb@changeid>
MIME-Version: 1.0
In-Reply-To: <20210205135332.8.I9e7089b60ce4ced76429882e8f19f549de7e11fb@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ovidiu Panait <ovidiu.panait@windriver.com>, u-boot@lists.denx.de,
 Andre Przywara <andre.przywara@arm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ard Biesheuvel <ardb@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH 8/8] arm: remove set_dacr/get_dacr
	functions
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
Content-Type: multipart/mixed; boundary="===============5935347737944163494=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5935347737944163494==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iBHcHRCIarfY7C0j"
Content-Disposition: inline


--iBHcHRCIarfY7C0j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 01:53:39PM +0100, Patrick Delaunay wrote:

> Remove the unused function set_dacr/get_dacr
>=20
> Serie-cc: Ard Biesheuvel <ardb@kernel.org>
> Serie-cc: R Sricharan <r.sricharan@ti.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--iBHcHRCIarfY7C0j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA/3u8ACgkQFHw5/5Y0
tyy5dAwAnaQRGrLHyOnN6rgF372WnHCTljb3v4KvOBvfWO8OYDScz47jaJoXbpd+
jAuipTgMZZaDnVgEVcUg10WNr0H5qOpyOTov1U1gxb5ps2pic85+ZQnf4nVHSKt9
+a4KdKgnLjVnc0XYlt0jXVRFp7ZiwZslDv5uPN8UCcPndGDVghSIGgKYIrnIaBNm
1We5pRl55sfZDs5Sbczw1U31BTnlY0b2Q/KvN8yDyAENuumrwAXq4gMFfc2F0cM/
5csEzEkQ3C6QZ57fc3+AEyqki098t/t8suGqt1BDuftg/Ni7yCiiK0Ph070L83uW
7IT9h+ZnY/7FzhGN9Ka1YZOSgxrzDD1lTCe914isLwkSu7magWIlXM+hcrwj+m/h
o80EdGEhAxw+OiFynxZlOfSwmVm1a6fDDNhCbpblw0DQbJtS2iTB+owdMGndDJho
ysHdV1z7VW7sjbaONCG2+1fyvlRxr/EHyogVtHp98BxTDVeu1wWVmJ2a61AjX2mR
Mq1Chbb6
=GTc4
-----END PGP SIGNATURE-----

--iBHcHRCIarfY7C0j--

--===============5935347737944163494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5935347737944163494==--
