Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E54DC1AE723
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:05:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 893BEC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:05:54 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93319C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:05:53 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id j4so3955494qkc.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5bRjpvpC1idfEIoQhucQEG6afx2SHZBfrnbvezkhHOM=;
 b=JIFVdToFAVN5sA5DWBL5NrYVmVTjRuMPMeL4W1tt03bJVRaNScT9qjiPyDV7KYGeHw
 Gces3J3VL/YttQvQ9wBYctvnbnljyzbX2ApFTmvkN9t3p+duYmRtc2C8bup86ZHL7Rrp
 AS12rIlKBPIjk/i2afapfGXLaE5FPViDckOaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5bRjpvpC1idfEIoQhucQEG6afx2SHZBfrnbvezkhHOM=;
 b=oNDlFtCuAc24WKNd8AL8Gn1ZCk1aG2EE+sTDyK5K0GqDDPbM8WwWtmdIbp6q6ySnUa
 5cilJlj41YWWMpPmseU1/whQGgTpdNuKXOKv4C6gQ06v/ufpbDcLT5yleqaiqzzua8ZI
 2EcmQ9m4++jzjcso4TPKjNZ/Xxyn1c8kwa3ned5lDEXGxFARwPBEDa8Zip38ZGNxggVo
 /HakDQ9moQjWcwDURcBlSg7RH8KcYebgfsfU19GTxkjH3vYAE4fTzndo06tK1QtXGVex
 UOVGcwH7jZobCbfrjqs7CCPmos+ztP85T6KDhY50bglZoZID/IHbzc5iHqtc89gVyMIJ
 GEAg==
X-Gm-Message-State: AGi0PuYTHtx68srYCrFIekR6OocCbGIZ9LfLMH8M+ghKLcfl7S3yZh1H
 EzthL+8PDpu/6LA9tH1AJdU98cNXVXE=
X-Google-Smtp-Source: APiQypKhE+WWTW4YklJwoe7I6S86kHVuNa4EeQq3VXeUoY1lEK3XNAYygrvRth6y2SRfjhRg0Te9vQ==
X-Received: by 2002:a37:b041:: with SMTP id z62mr5254484qke.487.1587157552196; 
 Fri, 17 Apr 2020 14:05:52 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id e133sm323955qkb.128.2020.04.17.14.05.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:05:51 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:05:48 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210548.GH4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 01/21] dm: pinctrl: convert
	pinctrl-single to livetree
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
Content-Type: multipart/mixed; boundary="===============2417125263965116606=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2417125263965116606==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline


--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:34:55AM +0100, Patrick Delaunay wrote:

> Convert 'pinctrl-single' using livetree functions
> - dev_read_prop
> - dev_read_u32_default
> - dev_read_u32_array
> - dev_read_bool
> - dev_read_addr
> and get rid of DECLARE_GLOBAL_DATA_PTR.
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGiUACgkQFHw5/5Y0
tyxXpgv/cVR9h2kQWn6M8oGYy+B1Sa7bQrO09U1QjZmm0aoaG7l8WUeRt0w27QhT
R9v0mHmr6cQANNHIqQYvhK+caTxBQsUSnJTC1HVfNGF6Mplnp4HNbgUV3BfjpOm+
f8/AP7pYDIMI+kCaHZkMmZpyGl9rAtn4LajGNukAeYbYW9WmL/Bhgvttg6ISmhZg
YffVOLy8/qmFad5wcfLewS1lMgNGnJGPReaLR0rljbIZZKxAE5rLJCdwqG7uedCK
9ByysOgYrmH4tXhgEYkprLNhGCzCGmqPcRfo9xgVUOa60amR6pbI2wzYl8Z3WNDq
QJzIv1CeSh0txDlwl3FaDjrRVPCUNwikE2UDi+i1TUn5VaE/ocBozLed5HfgydPY
5k5Rc9eoMihKirfQZQ1Q0WEFUMTTnovUyy+i5FhelFY9bQaVjN/6cWTX8xsH8jku
l0wN8A/0ws+6+zpVNfwjsGtpL80afO8YXT3DaghbqQfKpNtPRI4J2kqrqkKW8YG3
iNDhtilw
=XaR5
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--

--===============2417125263965116606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2417125263965116606==--
