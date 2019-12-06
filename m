Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8ED1158C2
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 22:48:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68A0EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 21:48:16 +0000 (UTC)
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEA70C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 21:48:15 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id o63so3593835ybc.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2019 13:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qlxsHgRoCmXM/7Dx6vtTr+z3RbX7TOh1nEjK34vbDz8=;
 b=PJ2ktX6ejlasT5583iF36ufzi52UvFnAC6cHijjQb5x0n18jJwCFfBatQ84zPJbrGT
 vB6NlP2UelTs8iHA1chXCZtLfewUQCxNpqzOjk6uARpAysSP4jkzD4xWdFQhV7kzFMVU
 14bSy0V2T1etQ15keuJ+sUGExh7TYgADVwmn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qlxsHgRoCmXM/7Dx6vtTr+z3RbX7TOh1nEjK34vbDz8=;
 b=I0HkU0eIe9uNFRAuaHwwdr1bu7dSgikFBCqrI2EcvRziBoMDX7z7RbdDhgxVm58AzC
 FeFs0X7Sc54zh21Yn+LuITGmgu/1jPVbkLIml/l0cMJz5RMQinb+9hxCChs9Eu+I1ZV1
 hubKjhrp74wwFjns4H9M/lpV/w1IDaasHZkdEPTL/JQnLBGAFeegVYo/FaDloqGET9se
 eVNkRcvztSbhZSlIc0wa8lH4y/VwhkfmDghIdHBkP7vBA1ifSy3oJGfW8bYO+gqz1bBz
 yZn+YKmpnwj54k4+J6RWeCNijI8ALlLI4W8+QcwZ3G/SgSGaSs05dkUQLEmVsWVsfAcl
 tymA==
X-Gm-Message-State: APjAAAVmnckkkRryP1eScKxtvjFRuBz38ws+eqza2qX6YKGdynprWlY3
 yorDWSl9CXZ0eIG5T+y7W4jFxQ==
X-Google-Smtp-Source: APXvYqw1GSo2oRl2TLTqwPVSM8Db8AL9fkem6C2dH4kJZker8jFkbhcviNXFyU4OVqiSibU7bVhrHA==
X-Received: by 2002:a25:d287:: with SMTP id j129mr11753987ybg.76.1575668893866; 
 Fri, 06 Dec 2019 13:48:13 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-d558-5e40-3af2-2592.inf6.spectrum.com.
 [2606:a000:1401:86dd:d558:5e40:3af2:2592])
 by smtp.gmail.com with ESMTPSA id e63sm6602416ywd.64.2019.12.06.13.48.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Dec 2019 13:48:12 -0800 (PST)
Date: Fri, 6 Dec 2019 16:48:10 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20191206214810.GW9549@bill-the-cat>
References: <20191125080741.2215-1-patrice.chotard@st.com>
 <20191125080741.2215-2-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20191125080741.2215-2-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Leo Ruan <tingquan.ruan@cn.bosch.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 1/6] cmd: Migrate from_env()
 from pxe.c to nvedit.c
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
Content-Type: multipart/mixed; boundary="===============5482793357279782786=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5482793357279782786==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/y22NeEwcFZzLrjf"
Content-Disposition: inline


--/y22NeEwcFZzLrjf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 09:07:36AM +0100, Patrice Chotard wrote:

> Migrate from_env() from pxe.c to nvedit.c as it's not pxe specific.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--/y22NeEwcFZzLrjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3qzJYACgkQh/n2NdMd
dlJTRhAAsmnt8aArV1K8Bz3S7wpV2+/6I3VrQYWlMk4jRSJ+tLlAqlMXLSM/Evcc
3hZDUbcReJ/jeGm/5hqHpuLmHYq/KkPmsHp8FnYO0DGEbDNZAyfdute6+7npm7CA
aqXWsV3Cabdpne4FYArZ22ZsTy44CKFSxFDe6ooh9hoCpq60d1QMbBABkgURSW/h
TCEuBGRi40RLvtyHAP4VNZNN3hxPv2n4M8bpXXJKT1Oh2dY3mP4Z7bCcd1fEBOQf
xgT32fHGx+JLE08pP5g25E+MfxK6pU3e4BMXN7wUcQqjnyM4bEGQ20ABHcdTFEFj
ya9/ioNqYouagB+9IE+j6vc2aBZyeXdsMl47oKjpv0XiBjHF1Wx193cpUROKWTfF
mqkaneEtRE/VU4VSmJI15LxkVwIOSZkaBEsZSfvPMwxB1uWy8zcQUCW8ooe4j3lC
ep19anXnB+A7rjQSijEtN5LF/9tIUg8sfn7zZtKYpCU0UDThnSw6g4lWC5KQQMXL
xWilfcRQTVIsrBSPQ97vgkxezHbCPeNBUSoizbdNe9JsYIfjPj/ndnZ514Ye+fzK
2dQos8YpB+OE0Xw2ZFt9Xue6pLz8WdYHlZf3oCzPe9vyAthAolI02sMKPxntM5Pv
YffqThTXfiZkMAoo5hBcir8rsNXM9RvZz389wRX/XYeAhzWl6Dk=
=pTKU
-----END PGP SIGNATURE-----

--/y22NeEwcFZzLrjf--

--===============5482793357279782786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5482793357279782786==--
