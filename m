Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE502F8DAC
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:24:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 963E0C57190;
	Sat, 16 Jan 2021 16:24:25 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01F3DC5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:24:25 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id a6so8341667qtw.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IBtncYdyvKDLxAK7SotWvhthctam2tlM06CuAVLIlXM=;
 b=Gw8d2EtZNRsjX7PYbJwVNl4bVfk9Ic7jXP5/M8MB+0zZS/+vrYzxrVkfYHrcf8wE1W
 Y9RO/qpT6/0WDrYFSix1fAWMfD1gak6McMpjcMc3W8YPR62p7DWPE6yKxvDWsLljtnGz
 TAQmAkNCB4+1YmL3SvctwiqQDppFSTEtRi3ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IBtncYdyvKDLxAK7SotWvhthctam2tlM06CuAVLIlXM=;
 b=VvGlG3LcMMcw+W5bbgvtlxbz6BPsrDzox2TwKFyTKmfIXXwCoepz5ptebmWtfbfutf
 MfKTtd1VXuCLeB8TyAG9JJbzy1j3+WkDEPIZY9xOGl+m0lgDZkOwY4Cq59Roq2wbtEbH
 sQb+gm7halt82CwfE3JCa7qWz4FIQNX4heIYeuXrnbFUPqlNu2KGhqjCBNAcCrbbExq8
 Z0NSU9wYV0VKl36+3bEF0QjMH0WyjSpwzv5HwbG/+pU4DRP9nzZDF27An1AkLlTJ2UZK
 XJ06O9q1bMN6DkZouPN0XaFbRjoPG8L7kcMPiOg/sbXFkcSmEkQanTulaM6+uwm9Fex6
 z2Ig==
X-Gm-Message-State: AOAM533p/aqknJBgejAlqTwDUEbOv0/krd31sZLBepOfUIJLNQtDKMdc
 O6XxmSP/0oNMX/mtDjbelxW4IA==
X-Google-Smtp-Source: ABdhPJz5W4Q86KyzLvgec72p+4tF+HZSndjNjXH/nwVFW6esprM5HX1zHVX2evgwFgU4HO7TbywSDw==
X-Received: by 2002:aed:3aa5:: with SMTP id o34mr11203739qte.139.1610814264028; 
 Sat, 16 Jan 2021 08:24:24 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id c62sm7157422qkf.34.2021.01.16.08.24.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:24:23 -0800 (PST)
Date: Sat, 16 Jan 2021 11:24:21 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210116162421.GN9782@bill-the-cat>
References: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
 <20201218124642.v3.2.Icd4f9239c00329a77c50bc0c42b3638c744ea955@changeid>
MIME-Version: 1.0
In-Reply-To: <20201218124642.v3.2.Icd4f9239c00329a77c50bc0c42b3638c744ea955@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 2/4] console: add function
	console_devices_set
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
Content-Type: multipart/mixed; boundary="===============3134296984492364484=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3134296984492364484==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="626OCQS0lFJXe+9/"
Content-Disposition: inline


--626OCQS0lFJXe+9/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 12:46:44PM +0100, Patrick Delaunay wrote:

> From: Patrick Delaunay <patrick.delaunay@st.com>
>=20
> Add a new function to access to console_devices only defined if
> CONFIG_IS_ENABLED(CONSOLE_MUX).
>=20
> This path allows to remove #if CONFIG_IS_ENABLED(CONSOLE_MUX)
> in console_getc function.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--626OCQS0lFJXe+9/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADEzUACgkQFHw5/5Y0
tyxutwv/SkLsGmZCk+94o3JdjaoJ09XrnAePJZ+X44AXp5/e0lfvIpj6e62QUrOH
SEuJqeEhDwAZZAEsD3QYDghl8/lpf77vs0dmlvq0E5TR/ICYjbEprGyMUnY4DVaW
w4XMWrppMhCSwWse94Zc075yKKulyKrLpjbFpP2p+ZcfESPC+TOB/owVXUd6v6w+
RUPIvYNoqEWRlzPBYLvdDijiu8B/4t/6QVrUUKvKajH8z4TRMJ4hru9jSdj2gYDo
XZTLS+hqf0aQ6bVO3SEF16NHgqyYGb2DctB2Pmdin/TzDLo/34Sw/r4SRtPCuFq7
hixHYF8n0m51gM/V9WrdQbvs+dDoj+QxSbkLheJ6GHHMfKQnJLD//AEwVO1J+2dD
faoIEliHQq5kTqy/Ple+aYY0AZu63+gvC1FUdK0get9LwOMilPFg0euQuqDPyvtf
1yeAW3KJm79CrUlV+DKSuOjlJwyLjRDSrPcTniCTJ+51LFDWg2W335mk77vBS0PY
hsJL0duL
=QTeb
-----END PGP SIGNATURE-----

--626OCQS0lFJXe+9/--

--===============3134296984492364484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3134296984492364484==--
