Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7594C1B25E9
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 14:25:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C32FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 12:25:41 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2517C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 12:25:39 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m67so14142661qke.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wnEITQ3dyR6dgsV01R8WMIkcFCXATVkQZ6rbR7XdVCY=;
 b=bSJznaYxmvShX3I3+NoqD2Nokf8yuIamAvGU8lnkWIIUyZ+hG00AThi9kVIfre25Jl
 zvkAksyxOYvtJcpBH45sVkJlZlF/zfgU9Fx6bs3TMw4pPtDiREik3hJQd/HxlgJZB+Kw
 NcCIXXp+hqDb3agz5xLp5cVRy/0I3Kw7UnSkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wnEITQ3dyR6dgsV01R8WMIkcFCXATVkQZ6rbR7XdVCY=;
 b=M8UJaTpZkQkkFNzEXsyqP/11IK2HCfB1b2If1+QnNiRiZk6AvlJEuyJTrbM7erxhBB
 YzMOl8PO4uJNVJqhcw8H2Xg+Sl85q9b+zsVSocHChmoxYdt4hogCCeK3t3E8efEUk4LT
 DZeyaBpGWZbmbNW1Lfw0J9qdvgA4EpjweaQQYd5Iev+11VRNNNx9xGGiKMq+TSfDqnnl
 rcU92bbUDX8iRRXW3JJilM6dFrTCNLdJ0AlzGylN7K27DXidcS60MSIhrg5h3DjNgMX5
 v2/iZR58qnnisCdK/VaZgkgJRkx0aePwcD6Z/m844NhQSba/roJHgnncmKcQsU0FqJ5Z
 apCQ==
X-Gm-Message-State: AGi0PuaDZ8cNgIlHXoCjg/fhjYV8M0iZV5jB3cvizPDvv8ZJDWjbYIyj
 vaYLMoo9UxCWlwFXQfi0TY36zg==
X-Google-Smtp-Source: APiQypIci9+SeMr7uIcYgRgb1mTCsr79ipovrpWct1b6cbCza92F67O1HEIhXAdNxebvW9Jz8V1G8A==
X-Received: by 2002:ae9:ef93:: with SMTP id
 d141mr21268328qkg.311.1587471938543; 
 Tue, 21 Apr 2020 05:25:38 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-3d58-7014-cb56-b1a9.inf6.spectrum.com.
 [2606:a000:1401:826f:3d58:7014:cb56:b1a9])
 by smtp.gmail.com with ESMTPSA id x43sm1628652qtj.65.2020.04.21.05.25.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Apr 2020 05:25:37 -0700 (PDT)
Date: Tue, 21 Apr 2020 08:25:35 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200421122535.GR4555@bill-the-cat>
References: <20200213182950.10744-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200213182950.10744-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Joe Hershberger <joe.hershberger@ni.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Keerthy <j-keerthy@ti.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: bootm: take into account gd->ram_top
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
Content-Type: multipart/mixed; boundary="===============3227549457905194830=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3227549457905194830==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NV8Q+b3U03j8aVmL"
Content-Disposition: inline


--NV8Q+b3U03j8aVmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 07:29:50PM +0100, Patrick Delaunay wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>=20
> If gd->ram_top has been tuned using board_get_usable_ram_top(),
> it must be taken into account when reserving arch lmb.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--NV8Q+b3U03j8aVmL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6e5j8ACgkQFHw5/5Y0
tyxRvQv/T05BMfuJ/evUWHQHPNdSMuGm7eFAT3zpwHXwY4cDu+CsZTppNYRFB1JY
IAFpOw+IS7cJJKfE6iWBSEz8oNati44cyOmWcTyAa6+QIZNbkqlp+iTAs9qIdBmM
YT4Wd84wX7DEgl2n1t0ztiV7QNnniIAudlclUDbVqIV7FYKccxW+Ov23MJpGtW3q
Fbu2l8De3kPz1DGmZRlYNBVQRH/ujaWu9evK43QetDlQZ/RIDJDhNQR/mVodlOWL
1GIYvRCOUIPjt7+TvNgZ6Z7tN9aO8bc2/MTAEQkvv5caNvgcsq5AKYSYTFqmnCXR
rkc+hwDad9zu6TigdkJy4qzSGtegKDTjtpy5TDeiv139oxdEPH5uCYxW7/vovh++
a1BxOSOfSVy5xV+ZfqmAYW+1tTXb0Msxr2kCJdRyHBEJOZDT+gNHYnfhI9xfql2I
VgLjh9AP/MZnM9ylO2v/lJzQMX44T+xAem/nSVrH7Uq+5io+IDilFspjIELB6Own
Pr+Y3dYV
=CpvS
-----END PGP SIGNATURE-----

--NV8Q+b3U03j8aVmL--

--===============3227549457905194830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3227549457905194830==--
