Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D46211AE734
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:07:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EE48C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:07:32 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF047C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:07:30 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id di6so1627200qvb.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F2lu247XF7VgUy7/itKhQDDfOY28rp1GG4ZpPVGTteo=;
 b=R1Dfof3rJxa70dnGdaRXL0DApn0xdpCIO7ffXxBiq13j7VGZRhTrNJLr2hIjzI9caZ
 tJIX82N4awMAWXLopGnruUUUlBt19HytGsOAAXzJxm2ODnUU2oMvlgxRqj0/8m6lH//3
 BCNlUX8RkQ2azFxVKs0CD3lFPcsVnoH/Af1ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F2lu247XF7VgUy7/itKhQDDfOY28rp1GG4ZpPVGTteo=;
 b=oiJUh0bmAdTT3Wu28KQw55mhQ6qfRrzmitgAV8XyH5imIm/3IVTgVXUsiN7N49TPB6
 rJvrZLktX6THmZlDJhVy8i11/nI4wm8JtGSkLIIVpPar0lP8HzRRBih6rKkrBkpQPHwe
 jXRiTsHw8d//foxWEeaUqeW6MVvacjqI51qkciHoVYWRAEdVEsIj8UuyjFES+Unh2uHC
 TGGjWem8AOYMsbhy0U1qNJd5FAKcfSYZSkJJy1fiarvQFYvdIIGh/R/58UqWSAYIHWCA
 /bVb8VeYXewdqrxgP899qxxU96jwJp8CyDdvUyy88ROP9oVQy3VZEn0B9YYB4hHX2tqE
 L7Pw==
X-Gm-Message-State: AGi0PuYVt/Ak5wjEJsTefpW8eH8uZmpfoBJELRcRQDKXaadOJeDXG9Yl
 SuD8gF7AOxG7PGVW+bms1d9QBzsiiBw=
X-Google-Smtp-Source: APiQypKnLL/1KkIETiX1FuvmwqR3v7xam8/bMWco6kALlKOAKJ8WJIf2tPeVxtgq6zbcVLz6WdFtzg==
X-Received: by 2002:a0c:b661:: with SMTP id q33mr4634246qvf.190.1587157649848; 
 Fri, 17 Apr 2020 14:07:29 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id g47sm4700347qte.54.2020.04.17.14.07.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:07:29 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:27 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210727.GY4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-19-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-19-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 18/21] test: dm: update test for pins
 configuration in pinctrl node
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
Content-Type: multipart/mixed; boundary="===============3404742529969587876=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3404742529969587876==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tRcR9GoWqjXrt11v"
Content-Disposition: inline


--tRcR9GoWqjXrt11v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:12AM +0100, Patrick Delaunay wrote:

> Add test for "pins" configuration in gpio uclass with set_state() ops
> and test for generic parsing of pinconf_param array).
>=20
> set_state() is called by:
> - pinctrl_generic_set_state
>  |- pinctrl_generic_set_state_subnode
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--tRcR9GoWqjXrt11v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGo4ACgkQFHw5/5Y0
tywMNAwAqKvopwzDqfcpMfvOd7VKiYS/7gs1bXS9PAx8n9QnwJ9kiGQ1gFiAqAFY
EwBZPl01X0BpLyObes25yj7g4XIBPPu5RzC4fxW5VgMT1c+XgJSg9d4GTcJeHgar
tQtHLQ+Snj4hUM4euuKfYhn+7rURUsDytM/zHnRMjke1o2I9OX6sh3GARqNrVohD
fauBEnYsyXFRC6bMPLGrZY85BBO+LGHVoC/eD7QPv0TIk4bv4ljmfHGIoXF5bo4v
DdYnj8djvsX2OvND36+lQcngo1WZvd1uOrh4ErUZDNNQ+KVNKae3ah33KSh8nYOV
VA8lr4S2oE6bLGyYdjwYwsH8/EMHE2xXV152kVqbPHr02ibZIWR1Rn0algEPtHWo
njZJ8nwPMBCv4+GaTB7zr++Efm4mG9cNNU0eiUX15rVucgbtS1cn6PJNdl0ACueu
qOibpYu/xpoy3KXu3IbXy8vr+uowkO9TZIr/4+UM4sc2/1zdpo6OR8eTu2wUMeL2
InXRvq/w
=WASt
-----END PGP SIGNATURE-----

--tRcR9GoWqjXrt11v--

--===============3404742529969587876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3404742529969587876==--
