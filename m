Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 325D758CE50
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Aug 2022 21:07:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB717C04001;
	Mon,  8 Aug 2022 19:07:17 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 434BFC04000
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 19:07:16 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id u12so7262936qtk.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Aug 2022 12:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=Lz1sJjOHEC1hj9ROtic7lup4gIsgQoyPWl78oSl180w=;
 b=nyzfyXQgUnRaxQd/A00mLRFXCDA5X2ZMkXpOeWRkTIXpcflAfoE4lDKG+nmMCrEw3m
 Ks+428Mw1eNAuhTSww+8nBdy5ixAHrE+qFLgoljbH0eNt+pbklBuxLrNiRdE4wKWa8we
 Fqm6wu7kzMSvjVN9Rg274q3/39Zmbl2Blu4qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Lz1sJjOHEC1hj9ROtic7lup4gIsgQoyPWl78oSl180w=;
 b=YK6g6G/9f0bbMrZggcHd94LvGxthfWGEl5pDwZ1OhBeqex1QlzQGx227/yMz3VwEog
 kYF5oRjkH+ok65KgNiytQBUzk/mn58Fe1Qn0L/9xEidwFj7AbWfe60Q+j6lvX6XNiXoR
 PRo06C/ipDQQ8tFdr83V1bMQthdgy78uiCsJLDeU/JuXEuSAdwm6rBzon5ewcmnuXvKG
 paSGOkhvBEa02M2WBvSVSbyGktJp+MFhqfuN4DUlV4AVe3uDRg8efUPA80cJADVM1xbf
 ViFVhrRnL/f29sZ4AfiCD1stHLD2SwWlLwZ0rsY77wZjm8S/hFfXgbxMtAcopHwHsdb2
 qnKg==
X-Gm-Message-State: ACgBeo0N4MrxYZPM7UtIS13u4DSWUap1f2p/O96tQ0yp7g11cDP+hDAL
 poqpBwDRbYThOwzMrg+dO+xjNA==
X-Google-Smtp-Source: AA6agR6yy0ekuK7basYEVjjsMZnrZqwTzrpQD4zc1N4jogeimtZOUu9KwQeAXR5XSmHPxEMN5QfeVg==
X-Received: by 2002:ac8:7d92:0:b0:31f:1fe3:2bfe with SMTP id
 c18-20020ac87d92000000b0031f1fe32bfemr17458913qtd.628.1659985635190; 
 Mon, 08 Aug 2022 12:07:15 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05620a24d000b006b8cff25187sm10546289qkn.42.2022.08.08.12.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 12:07:14 -0700 (PDT)
Date: Mon, 8 Aug 2022 15:07:12 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220808190712.GC1146598@bill-the-cat>
References: <20220630110938.1.Iada23492743e3af977e07c1f1b8c2f32550436f7@changeid>
MIME-Version: 1.0
In-Reply-To: <20220630110938.1.Iada23492743e3af977e07c1f1b8c2f32550436f7@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Ramon Fried <rfried.dev@gmail.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] net: dwc_eth_qos: restore support of
 not cache-aligned descriptor
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
Content-Type: multipart/mixed; boundary="===============5647443020735518451=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5647443020735518451==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8gqjtJoigqjuciI8"
Content-Disposition: inline


--8gqjtJoigqjuciI8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2022 at 11:09:40AM +0200, Patrick Delaunay wrote:

> Solve an issue with AXI_WIDTH_32 on a the 64 bytes cache line platform;
> in this case the requested descriptor padding length should be 12 but the
> associated parameter EQOS_DMA_CH0_CONTROL.DSL is limited to 3bits =3D 7.
>=20
> As the DMA descriptor can't be correctly aligned with the cache line,
> the maintenance of each descriptor can't be guaranteed by a simple cache
> line operation: flush or invalid.
>=20
> To avoid all the maintenance issues, these descriptors need to be allocat=
ed
> in a NOT CACHEABLE memory by noncached_alloc() when
> CONFIG_SYS_NONCACHED_MEMORY is enable.
>=20
> This patch doesn't change the current behavior when the descriptors
> can be cache-aligned with the field "Descriptor Skip Length" of
> the DMA channel control register, when eqos->desc_pad =3D true.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>

Please rebase this on top of current master, thanks.

--=20
Tom

--8gqjtJoigqjuciI8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmLxXuAACgkQFHw5/5Y0
tyx1wwwAq1DufI79TjhTLzQ9DKsafNC9Pdc2IB0/GOGp3D2BaoffipBtZ3FmNflR
4WSxWbQ4uLJ9fFyoOrywOq+K47YvKVgoioRzlwgDDT8xysfvyN5XYmb436jd2iWI
KCopdYwdu8SDjvm978HiVMPPGmWHuZWUHU3B+GaBy2KvYF9QetXBpm64zWGOU9YD
PV1V7dj9lcb2uq/OecJXx9BCaf4QzfqWEFIgQ+I2G07hK92BMd9tQ+xrqyOcn0Xk
PrvHM8WeAreNEIS+ILZDI5hvmfp7dmOLWjoUC8GlOAvNnzaHtF7AHruEfwWSZqM5
ah7uL0sSPHU4Nxp+9WvnSCfF19Rsvd8jBr6PaBuYpXurEs4kuZ8F17+kGkc+YXbB
VhLX7gtRlj++H1hhxutiYrYDHtdvcpTC/5F4t17x4/Av/TD8s8AMs2hUHJXmP3JG
O/e3uzMZFclfsE69XjCG2yHiNmYffRsRmAR8D2ntuWgl4mKDNnBO3U10MHMGAEgD
kYmb4k9e
=GVEO
-----END PGP SIGNATURE-----

--8gqjtJoigqjuciI8--

--===============5647443020735518451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5647443020735518451==--
