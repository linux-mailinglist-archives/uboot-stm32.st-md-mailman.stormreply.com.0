Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB991FFBC5
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 21:25:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D69E7C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 19:25:51 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CD40C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 19:25:49 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id n11so6726918qkn.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=L5Lg4XLf1jBP+Q5ygeJd8IWyj+pzHmY1mz1FMyYEZVU=;
 b=dIYcY7HW45zETso5pUu1LE6JuuMy0uNGF607wete73Khv+70e9In6lnybAeCTUibwK
 SO6YO+0t+aBKKAxQwQOTDN/n/AKUI7Aj4r0mBGPeeEvukD02And5nUQlJKRUoN5k69eU
 yZLJ89DTdR8sDx0saS+V7YVAwRneGCnmIDyEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L5Lg4XLf1jBP+Q5ygeJd8IWyj+pzHmY1mz1FMyYEZVU=;
 b=b+5l2fWKy8ePj14GeFXMkAPLY3ILOwLeh3Far5N0hv4JV2yApx81ujeISuinZqgGWK
 xXuPFhIPVUxMxE3L/U8WHeNXhnkVS5wzo2RFrXPCd7+Mb4WdaCk/mb/xNF8PSuRU8ynR
 SrNkmkujvYiC1jNfKqsxCVHQr8O5FvwYcqrN9Zh9BrXHPvm5Mwsn3pJXEmzAcY09yoJ1
 ijLhgFzqX2IyulAqAPAFyIF8VCntSOWxTQYMUAV/nlwynUBlihZadoiY0zXX3xNY6Nlr
 GqCo7gfDthIuVjEjtIZ7PlELWL1TiTfX+gu8ymKpjwIijCWiuspvURgf4nUBP2hNZ7Fe
 nkAQ==
X-Gm-Message-State: AOAM532f/L6K1iHJOBitk2ciVRS2CGE1d82qhY1maKwh/B+FsEX0fcM9
 HIBfN9bXRb5zT5BO7Ef/sb0+ew==
X-Google-Smtp-Source: ABdhPJxCbjuEai4L34w3UjfqLPdLwHTJr5DEFuxgTjBnL5mFKAsAIXjkBk66DZD9XXQocdTFMf/rSA==
X-Received: by 2002:a37:9f44:: with SMTP id i65mr422498qke.103.1592508348340; 
 Thu, 18 Jun 2020 12:25:48 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-3530-e3a2-751f-ef7e.inf6.spectrum.com.
 [2606:a000:1401:8080:3530:e3a2:751f:ef7e])
 by smtp.gmail.com with ESMTPSA id k10sm3629294qkh.47.2020.06.18.12.25.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Jun 2020 12:25:47 -0700 (PDT)
Date: Thu, 18 Jun 2020 15:25:45 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200618192545.GW27801@bill-the-cat>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200616074048.7898-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/9] env: add absolute path at
	CONFIG_ENV_EXT4_FILE
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
Content-Type: multipart/mixed; boundary="===============3286775139722167061=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3286775139722167061==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EDT6MSV0B3GxyNyZ"
Content-Disposition: inline


--EDT6MSV0B3GxyNyZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 09:40:40AM +0200, Patrick Delaunay wrote:

> Add the absolute path to the default value of
> CONFIG_ENV_EXT4_FILE =3D "/uboot.env".
>=20
> This patch avoid the error :
>   Saving Environment to EXT4... File System is consistent
>   Please supply Absolute path
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--EDT6MSV0B3GxyNyZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7rv7kACgkQFHw5/5Y0
tyzZUwwAgOvwIUpEUJF4b/OBpn81Xw405ff2Bb6AfK8UFBlNifPCd0dv+rbAvTKC
L1jdNdl6NCY1yfP4gcgm7n3B7y6rcXp2/cRmtjT7P4k55ENFiWwB2AuJAp/f70sV
X+gXHhwQpkmLilry46dHT3nrt+IimoZbXyuAO8uGcHf4+1owKm4x0XIYZrHFVHYj
9bGgF9dOMotFewETnqzEzpCqg/oXha3BA0+9GRdyjTIelMNCt6b52In+fi8eIcAR
RB6ZlUyHxj6TDV2MecbGL7Yy9RAyJitaqdByhA79bNQsIA5IepPBBVPIDwjR8Wsl
kweqNqAqsbdckaFlbmuzpxwHAkQXx9FbcwKh3Sf+m8kQPkV9U+zZ6yZS3q3iQBAL
ZlOYZ1tqGcmS4UPMtCJfL0IkI84uacdQBkljQB/vm9MQ4dcZSAD3Y6zXyFkx7Xxk
yjaAKgbrQGDCbzXsABXFg9+v0tX8uQFyh+dnhwgUwv2zpgYRQUvZK0sfgabqF8fD
aectiv9g
=oFN3
-----END PGP SIGNATURE-----

--EDT6MSV0B3GxyNyZ--

--===============3286775139722167061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3286775139722167061==--
