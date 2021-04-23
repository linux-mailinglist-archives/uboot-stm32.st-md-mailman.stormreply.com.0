Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E65C83696D5
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Apr 2021 18:24:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFC61C57B54;
	Fri, 23 Apr 2021 16:24:08 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76F83C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 16:24:07 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id e13so40298516qkl.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eF+X5qHPMI8Zja1yFv7dGmyJv+Wrh2cDFRolqEFnPp0=;
 b=JK9Z2J8FJPndAGJnfX8jJ5G00sW0qqhp7/cmWZnBxB6FDlpcRlKEJw5OiM214fYSxX
 ynFpbvIQQmL7xL1FIVCyxN356IDpnfyKOeT1ZMaXQ6ZetH8elKupmbxevrYYYtT+koLG
 LJuKOd02BI0aZK/y6KS1lFJERaWvFZL1BWWAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eF+X5qHPMI8Zja1yFv7dGmyJv+Wrh2cDFRolqEFnPp0=;
 b=KWQC1aYEzlZ5GgugznH/szrYswWZiwFMbp+uIofq6rMKVi+AlSeekLPv7tkLRyaEHU
 +/La2y74/Ee5Pms+fV282BPE5Y13UKYYXueHWJyVnOoDkUXLYFmMoAU9iuwnhSiy6v9F
 4XtPV6LQ459Nu8gtnNexcyPl+PQbopMzk31yZIjD5UWZYkLefdcK7ph5fWDzWAx2wUg6
 I07/PKCyQly1WVhqV2K0IcCyVJN26GdmwOVB+K6k0NcmJ52EFZKe/LzGKzXaHarK6jFd
 WRgFKHYSM1eawp18CToGLUyqDlUFuO/kDVzR1h76ohSC9MOQLwH1+GPR70+RexYO3DKp
 RGCg==
X-Gm-Message-State: AOAM530gjnXknuKah243535wySfL8DvubjJx5NdzR6T9vAqN4FMhEBk2
 xia22lwMIsnKbOWChLNEYtDBTRm40S8GBg==
X-Google-Smtp-Source: ABdhPJytSnmNSkZjZIBumul5kr07yXARQg3CtsqKyGX7hcYM2R9U6MIMMzEgHcuPOQl4m5u3huUOTA==
X-Received: by 2002:a05:620a:16db:: with SMTP id
 a27mr4843136qkn.251.1619195046495; 
 Fri, 23 Apr 2021 09:24:06 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id k127sm4607387qkc.88.2021.04.23.09.24.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Apr 2021 09:24:06 -0700 (PDT)
Date: Fri, 23 Apr 2021 12:24:04 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210423162404.GR1310@bill-the-cat>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
 <20210310101622.v2.5.I94c52853f676d92dcacf734240d54cbb6bc38ef4@changeid>
MIME-Version: 1.0
In-Reply-To: <20210310101622.v2.5.I94c52853f676d92dcacf734240d54cbb6bc38ef4@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Tero Kristo <t-kristo@ti.com>, u-boot@lists.denx.de,
 Masahiro Yamada <masahiroy@kernel.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/8] lmb: correct size of the regions
	array
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
Content-Type: multipart/mixed; boundary="===============4460717143520770545=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4460717143520770545==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3P014ifvTVSe39L0"
Content-Disposition: inline


--3P014ifvTVSe39L0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 10:16:29AM +0100, Patrick Delaunay wrote:

> As in lmb_region, cnt < max and in the lmb library
> use region[i] only with i in 0...cnt, this region array size
> can be reduced by 1 element without overflow.
>=20
> This patch allows to reduce the struct lmb size.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--3P014ifvTVSe39L0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmCC9KQACgkQFHw5/5Y0
tyyGAgv/eZBsLtVlv8K8G4qO7ysJl2G8sJgLODI+EJAAtC3E5Mm/VBT718zRNQ5A
IpPCGYY8MbHfCt5JrYAZHdSyIpZdg5Mwnq5MEBJMgFTybMtJhn1fAJKC0AXWqlBu
1BWrCcWWdU0XEbJtVZ8EynBcUyP7w63nJNgCY7/32Mdd4PS3MgjCZtJKLkBXidTT
1JKAJLBTlO5xzXisAFBRq5cLKycdym194ZYhGAcl8SNuCYxM9roayAWoXm+prXCl
KLw8hWLrgVq7g5qZUOhvjxK6Q0rGUmRNbZmGRrPoPrC0bRGcSajQA5lBpUtG25X/
IpsEKM+SxlLtXP6dEp7UdWWeW8Urej98wmMPNa5SvAy4akri5A/8P3QMOS2dj4DD
Dm/zDPvCW6gW6fMtcs/ZtqurMjiacwC4BcwpI9H7JyTieHIUdG7f4JV9yyjLJv/p
ZpdT4PuytRsQjgdRvCLj4/iblP9GbQM4RLBZmhgd3z2H4eTOPMW/n2Vn08AcdeeH
Orv/UElH
=HagL
-----END PGP SIGNATURE-----

--3P014ifvTVSe39L0--

--===============4460717143520770545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4460717143520770545==--
