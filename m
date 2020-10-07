Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD62E286A06
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 23:25:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 668FCC32EA7;
	Wed,  7 Oct 2020 21:25:18 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27F7FC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 21:25:16 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id t20so2017033qvv.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Oct 2020 14:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TfYE9hPnVk2PAZD4JiWbQiYCxsnPdZAElnzbgEZR0pE=;
 b=O2NEbg8b0zEdBWuJkAahivchspT5i9lG1saGYobRqFMbDNaGA2P2G1EdddAAsUz5H0
 O5wNSF7dGrQbXwWsaMo/d7OZtPkshEkxcukgV5q7q0fdsIT5OPVOfjzJH6barEs4jEo8
 Z1ygpCWY17Lh9Y/9US2iT5gkkIv3AvVq1xhKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TfYE9hPnVk2PAZD4JiWbQiYCxsnPdZAElnzbgEZR0pE=;
 b=AWjUkP5vtMlbUFpZbYAuiZo9Wo9fk/CWfkm0KCRsbX4Y4iyaPVT5X1BLS4GVY5pDBT
 4actyz4zSelHZb3ZB/4RHrtX6l4bTS1iaIJDugFFlNQiwUr8S1AzlN8/0JslbT8h7BiY
 A1yv+81mDF+CWgiO3707zK4Y+4YYd8EkJIHZJ3e4vhl4CdGNN5vLlec+TTwcNkN6mq8C
 aRGR5iWQFyRrzo02zUAR1dQZNkYSvG4jIbogXp9MCvGF7lCFM/Kmc2yfZtgh8ZQEsmar
 fzAG0KW8OCOsWlLxh+os+B2F34i+LOguPykzOurc88P3Je752AX/0bHUufUbPIKql1/j
 nU8g==
X-Gm-Message-State: AOAM533AK5YCaxrHHkbh92wrXw2ZlN98olvadDxzbb/Z5etb3F9Sii5j
 vDxE5oFC8t/CkcWGg5RRBeGnhw==
X-Google-Smtp-Source: ABdhPJzriOfxm4TETApFZhwoxvN12N2UGHsbQJ1DFj8h3MVJw5dK0mvLVZA273QRMCxyVAkA/82daw==
X-Received: by 2002:a0c:fac6:: with SMTP id p6mr5196177qvo.5.1602105915916;
 Wed, 07 Oct 2020 14:25:15 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-b485-f8d5-5f78-0a27.inf6.spectrum.com.
 [2606:a000:1401:8ebe:b485:f8d5:5f78:a27])
 by smtp.gmail.com with ESMTPSA id h47sm2531610qtc.80.2020.10.07.14.25.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 07 Oct 2020 14:25:15 -0700 (PDT)
Date: Wed, 7 Oct 2020 17:25:12 -0400
From: Tom Rini <trini@konsulko.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <20201007212512.GA14816@bill-the-cat>
References: <20201007161148.59389-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
In-Reply-To: <20201007161148.59389-1-xypron.glpk@gmx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Anatolij Gustschin <agust@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, u-boot@lists.denx.de,
 Alexander Graf <agraf@csgraf.de>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] common: rename getc() to getchar()
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
Content-Type: multipart/mixed; boundary="===============5011725227669966807=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5011725227669966807==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6EVlxZEFeUQbArez"
Content-Disposition: inline


--6EVlxZEFeUQbArez
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 06:11:48PM +0200, Heinrich Schuchardt wrote:

> The sandbox is built with the SDL2 library with invokes the X11 library
> which in turn calls getc(). But getc() in glibc is defined as
>=20
>     int getc(FILE *)
>=20
> This does not match our definition.
>=20
>     int getc(void)
>=20
> The sandbox crashes when called with parameter -l.
>=20
> Rename our library symbol getc() to getchar().
>=20
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--6EVlxZEFeUQbArez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9+MjgACgkQFHw5/5Y0
tyxmCQv/XtcahSO+nKFLRLM1sRtv9sraw3myIXY/a6Z13UPDg8MW9bd6C/XBgR9v
4DKJxex1HwsY9elR/EcY1jDQZzB5eYrxedh85E6hQQoxo/22rW/5KPFDb2NoPlOS
QvrgnAftFybiSeuGwdMG1kMXcld5yjOpia2JQQ98y5saVldy5lZCwnIV34yKjclF
xX4dBjzjJwhe+coI+4BN05XJ3k7u1VcjJGm6s6KYlyUkXqA7mLK06ndq51GHfp2v
Quya73WiKEdKsko7U4V5Ckn8CfVWlV4PqNkCcu1capDdEZ1oEt2GLTweIePr8jdK
fHqlK9Hmq2ZHFb51U8ijfG9sLfH/BKlRpK743HeE/d+jFWIif6EpfC3TOigcyowx
ec3RPHKXjG7Yn7Yl1eA/FTK1gOMvPf49V8PRKsYo1XURfwn8Q39DpQdBq2/n6qss
vOrACew0FS0QYvX6RNUJIxG4t9IBoD0VFStBp7UcaypmcjJl0jD5aDs1s8wepBgC
Rq2DuFA0
=UEiY
-----END PGP SIGNATURE-----

--6EVlxZEFeUQbArez--

--===============5011725227669966807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5011725227669966807==--
