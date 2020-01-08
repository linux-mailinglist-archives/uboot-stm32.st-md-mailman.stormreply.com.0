Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1AA134CED
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 21:13:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 091A0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 20:13:07 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5891FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 20:13:05 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d71so3907037qkc.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2020 12:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VgYxzmUeo6LAibronxwzFnyGVjW/ZosEPQuaGt+L5RQ=;
 b=ZLhTlS4HtADuIw4A406xGb54odGZj2sz6qMLszA/KXIiPTi6iFhCMO4UBvaN6RNzdF
 P5OIMKaBCOpq3xvwqO1k1MVBjNizvCNp+Y58Mp0yXCVJK3ddiMCF4eVLQ5SDBdqC5vhO
 0Nl+Qt5rOch5YJSets0uO4SpbufqafUZvgHzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VgYxzmUeo6LAibronxwzFnyGVjW/ZosEPQuaGt+L5RQ=;
 b=Att6GCF5DZUFv/SeUbvhDWxoSwQp3JIm7bTW0cPikYgxDKysYB04pJn4IfFZTtFSKf
 TD4dIQtSDKNCKX4LiNg5jU1l82fWTJEz4YFLFSvIJhEvfGuvF98q8/dIw3LeGif2f/Aq
 IL6sLfwOqRWuhcowA5yEcozVqAN4T2JA/i+ngLnLX7dJOQy/wvIbgwlT+QxsVybLztvi
 FGW9l/FwBWgu5GMSLoXxx0ond+uXzpIZMXPbZHMXN/+Yhdo+azUp/ugR6g0MOLrZkFKt
 /J4S5ngCqOLhLvPML1BiijLw8z672YVuPrWWBR28pufQdDFTFoq22P/dwrE1GAchIeyR
 Umkg==
X-Gm-Message-State: APjAAAV+pMt5t2xdhcLnvaOPf+boYDwK3Kv/j5zpSYF/yJUwqomyXJwZ
 TNw/lwYqja+RZa+W/m7Htlz6Xg==
X-Google-Smtp-Source: APXvYqx73lMRM1TPNLAqUpsJnWA/pL9RddCr1ljnnb941FLEDHlno20XAC+1jUeDSNvjruUfLk6sdQ==
X-Received: by 2002:a05:620a:14a6:: with SMTP id
 x6mr6376294qkj.206.1578514384227; 
 Wed, 08 Jan 2020 12:13:04 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id l44sm1115659qtb.48.2020.01.08.12.13.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 12:13:03 -0800 (PST)
Date: Wed, 8 Jan 2020 15:13:01 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20200108201301.GQ31026@bill-the-cat>
References: <20191206140149.7426-1-patrice.chotard@st.com>
 <20191206140149.7426-3-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20191206140149.7426-3-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Udit Agarwal <udit.agarwal@nxp.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Pankit Garg <pankit.garg@nxp.com>, Vinitha V Pillai <vinitha.pillai@nxp.com>,
 "Albert ARIBAUD \(3ADEV\)" <albert.aribaud@3adev.fr>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] treewide: Remove
 CONFIG_SYS_UBOOT_START from configs board files
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
Content-Type: multipart/mixed; boundary="===============4366561264435946747=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4366561264435946747==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q4RbCnAmn9VrkE5p"
Content-Disposition: inline


--Q4RbCnAmn9VrkE5p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2019 at 03:01:49PM +0100, Patrice Chotard wrote:

> As previous CONFIG_SYS_UBOOT_START is now set by default to
> CONFIG_SYS_TEXT_BASE when not defined, CONFIG_SYS_UBOOT_START
> can be removed from include/configs board files.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Acked-by: Lukasz Majewski <lukma@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--Q4RbCnAmn9VrkE5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4WN80ACgkQh/n2NdMd
dlLu0Q/8Cu4Zc6Lwy3TUU0wdJ5v6ad6TVlS7gAeFvkgUwCCr74DfbgfjecEKwsXi
dodM5cXrQD83gPdscrhyN7RUz8W0m5R7hYtif0WQDa6YKeCxfgrnUWDI4H4nko+5
3fcKQmMV3en0N8+Ue44Tjv7JzIafT/FB5aYlsdgFM1LF5A9zbUOvHDt65tPgsTRk
CviPsIjriBTjozr8XFx3tmIE4T+A3Tx4u6WBLbt9FIZ9OwF6TViv1WxGkIRJ63QY
couChrHA0WkkPVaprXGSce//dHuqx5GGejetytJ4JUNPFmdKeIG+n1PwqChI059i
wMjo2yKZ+JM2jB6qkqEobcf9ccxhravhJeie43PuyVOp1VTmP+LEzcfbgvTBOHvt
/Pwbim8/yCWdvUoLJ6poi5ZQ7uXCmQ4D4jb3Uwr/9wOqcbCGC6DFJwgL9AF3kMbg
4anWqC3etHbiKJ7nkbXgEWHI7e+/PlTjRvalQYL69w1fLL+bwt5TJIGoIluE678t
ybokVn2aSDiFhp9sNS4pwla7hJCbZPYcnT/rHKXmE2tSu9u6kq3f+X84qZE8jhv1
qR34Ejey+oft3RkXdXNyz+Wc6/+80DFPSOovkeUeXLb7L++vN58Qpj4ynUh3GLEa
tvnHsYqK8sXYIxoAzOpYK8FI5o6YgIYFoI0eFE8TxTDHMR8uZkM=
=3ajC
-----END PGP SIGNATURE-----

--Q4RbCnAmn9VrkE5p--

--===============4366561264435946747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4366561264435946747==--
