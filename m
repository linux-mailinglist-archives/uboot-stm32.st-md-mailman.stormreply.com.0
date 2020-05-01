Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E731C2024
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 May 2020 23:56:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39B0EC36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 May 2020 21:56:26 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38325C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2020 21:56:25 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v26so9113888qto.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2020 14:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hUTWwJ+95bKLX6QHr3fjBDbVV9MqZT+h+njrUiT+tek=;
 b=SQJ2O2EKLAw/nMRHA+hcZ5l6P4XLinUzZ9xYwgaSrAewwNcogCK0JO6Yriy5Rd8Rg4
 siTI1OrIR6jchwc6jlMWODX6RkCG5VXwxqEu4H5gqbnUD9x//IC6snThCK7/mzz+uW1k
 vhtQGqAn0GhugqFPF6+L6RmZ35hY6CRPyOnDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hUTWwJ+95bKLX6QHr3fjBDbVV9MqZT+h+njrUiT+tek=;
 b=WSAqIjD/MGUxgevPvVPr6i3kVjY9TxvwWzmy/4ui59Qc4019ugXd8mQ6zT1SFWeYaX
 SdnV1XdzY3EWDgX/MQTdw6lAArXe44nA4Tb5DcQE0XvmUpJe2sSjsO7bRJzERkWcHzcK
 0yFabMVZUaspAk63rgEKh8nGATR1EB/HsrvKpDHd7h2QR+M2BTHaTU8LYLsv3pCl3hGJ
 PSouwieBb979eq0ON9JaTZnHiIO3phucJth5qFb9PLNyOjTudgbug6Qx0hv74MBpIHNZ
 EZis6NsrjEKx7j/pwfrCrHOziHA1MiX1a46STiWArg0WAAcekhtZe2KHhFKRU76Dl2ua
 0C+g==
X-Gm-Message-State: AGi0PuY1LkadJEQZn+5KcUNKLboOsNO1n9P5TPmQuRyI5XfjXFJY5n86
 mxaDXY0/pLmQUKPUOfeHwPtG5A==
X-Google-Smtp-Source: APiQypLKprs/PGgezyKQtzrXvhlYqLPrKT9tj++Mn7V3bqZeyqq4w48E8da1O1BQ1q1/P/htucKmAg==
X-Received: by 2002:ac8:6e8c:: with SMTP id c12mr6141426qtv.374.1588370184129; 
 Fri, 01 May 2020 14:56:24 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-8453-a408-e16a-eb16.inf6.spectrum.com.
 [2606:a000:1401:826f:8453:a408:e16a:eb16])
 by smtp.gmail.com with ESMTPSA id h25sm3350652qto.87.2020.05.01.14.56.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 May 2020 14:56:23 -0700 (PDT)
Date: Fri, 1 May 2020 17:56:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200501215620.GM12564@bill-the-cat>
References: <20200424182017.11852-1-patrick.delaunay@st.com>
 <20200424201957.v2.2.Ib6abcb05422a74bc6bc03daa71b15c98c99dbc5d@changeid>
MIME-Version: 1.0
In-Reply-To: <20200424201957.v2.2.Ib6abcb05422a74bc6bc03daa71b15c98c99dbc5d@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 u-boot@lists.denx.de, Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] arm: caches: add
	DCACHE_DEFAULT_OPTION
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
Content-Type: multipart/mixed; boundary="===============3000419049462708257=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3000419049462708257==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="utPK4TBebyzZxMrE"
Content-Disposition: inline


--utPK4TBebyzZxMrE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 08:20:16PM +0200, Patrick Delaunay wrote:

> Add the new flags DCACHE_DEFAULT_OPTION to define the default
> option to use according the compilation flags
> CONFIG_SYS_ARM_CACHE_*.
>=20
> This new compilation flag allows to simplify dram_bank_mmu_setup()
> and can be used as third parameter (option=3Ddcache option to select)
> of mmu_set_region_dcache_behaviour function.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--utPK4TBebyzZxMrE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6smwQACgkQFHw5/5Y0
tyyYLAv8CdsB2Ry2jAej+zGOtE8b/MOG8T2CYOdJISmP3OrXOGtzlR40inEJExEX
LfyMScRmY3u14HNk07g8Kb3oGEhib6nZfC92dODg19d7gl1PZm84og9yDFjsnarT
z6VY08fZR8UyfKD0x+rpY7DZA6KJFAuxoEC4K75oWE111bOMpMvfrQx1OjeSH/43
tsInc6HLF9bDYSmYmWp5VyS4ItKWFgXZVyjhjrTJhzgp89ypmuvJ8T5e1K+2p5Cr
9MCf7cNcpRk+SP5lWbueqGONNIHWBjVKupIDj4sZbZNskq76mzGHuNtqY8ML5qxY
eM31Sr58qIJHtM9EmMrq52XvNSbTdS4vmutov+Hz5DBssDH4HagaqfASXRT/6/D8
F+/L+eugzZbBX+oAVlHUniGW44ITot9oOfzIrEA684K8SbV9Uh2vdjlE9Ckronsh
WTkxGS9V0QHgx8IX1NPkeNihBYHaOf6qmhNJ2se4z+HODlrJFjTDJHZniW1i+hET
iPH9Lbk3
=52JX
-----END PGP SIGNATURE-----

--utPK4TBebyzZxMrE--

--===============3000419049462708257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3000419049462708257==--
