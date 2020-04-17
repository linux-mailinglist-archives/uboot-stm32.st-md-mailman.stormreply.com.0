Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F38191AE739
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:07:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF604C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:07:54 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B83D1C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:07:53 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 20so3960218qkl.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7lTvX7e7LQo4KPp+qtibwHaXnRb/PoAHB2Y5WpBG1Mg=;
 b=OVqokrtEB38TyB9TWjPLPjrC2U0CWfwN+sOUz0ukUm8FA/a1u03UIDyzN0s8YVSB1d
 +t3zsdt/ZwDonvfUeJdm55eaOgvijDb18njb1lnAEDRyLzOTnYMsImO23xMmO/kOQPGT
 g8BYfnvwXZ574VtjfL9MIfcVQwNigDSejkjHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7lTvX7e7LQo4KPp+qtibwHaXnRb/PoAHB2Y5WpBG1Mg=;
 b=D+qCYM/f9X0DYjFM7XwQR1muvti7BGJ6xO0jyEKrl2ThoiFP4aZCeHGeecnxYeu1m1
 ISyrzVa6a8xH3PAneOV9F9OVDQ69iumAIvPKpV2JqbvW+zL02SbGQ1Oim1eM9Ju0PMXv
 9weU8aUoWxjC0kcc6Z3/Gy27wmjOjzeXarEiwJEfrjI35eNHSSmbG4U4YolcMQyz4+WG
 rcdTO/lsI/LbUtdmgXIy+UAcLOQYktLzNnLem6Qw6ooH1h4J+sQUk0++q2vv54JGee7U
 qtkH6wTL1STDYbalzddfoFfyzXyq2HwUcbndt+tK1HwVyClyH9KgW+x/j+W2YwCjbuW/
 ua8Q==
X-Gm-Message-State: AGi0PuZaeY/VZsVk/e5J3reM9tvpyTsdGaFW7dkHBDmXgreL+9hG8Azm
 UGeMYrucOlgDbaqja2896j1+dO79JbE=
X-Google-Smtp-Source: APiQypLKk1wbxs5S6GpghW3K6+FS93nlWfovShe5n2w0uCDahOdjWoMM5pE/ZedkiE02RGw8GGg9sg==
X-Received: by 2002:a37:6252:: with SMTP id w79mr5220049qkb.41.1587157672663; 
 Fri, 17 Apr 2020 14:07:52 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id 28sm7475519qkp.10.2020.04.17.14.07.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:07:51 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:49 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210749.GC4555@bill-the-cat>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
 <20200228141816.1644-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200228141816.1644-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, u-boot@lists.denx.de,
 Thomas Hebb <tommyhebb@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 1/7] README: update reference to *.README
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
Content-Type: multipart/mixed; boundary="===============7721661413734058722=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7721661413734058722==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U7NLafZe7Bh9OCap"
Content-Disposition: inline


--U7NLafZe7Bh9OCap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 03:18:10PM +0100, Patrick Delaunay wrote:

> Update some reference in README file detected by
> scripts/documentation-file-ref-check
>=20
> *.README =3D> README.*
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--U7NLafZe7Bh9OCap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGqUACgkQFHw5/5Y0
tyyrewwAijvN5deKkAXbI1YNce+N0duar7peyuPpOe6ATFDWe8YyHLBuLSf8Ac4q
+R7Uv0XnYeoWDm/W30CCGK+/KpMfIquJk4TgKHVqWf0dXwvlGXoOsGAHTzqIM33u
AkFAoGEQIn4nXHlflc3Q0Xtuu6hQZOQ7fsshIh3qNvQoUqF3KeJAVm7tY+8Jjl2b
gUYK2VRGBSTEv7KIO+PnUk0qh40MugVhJFNeiRh9H7WHOhFkPR6+SGeIwomVag9Z
+rOc59cEuruPNnR9KUPiMWGXA4BnCPMhZx/S0C/9wNnGfh4Z4hD7JgKLQHDBL9/c
lEvuDSZkC8gZ8F8iMvPLC7vdVi/yigiOFHqjUi1wyeeDKzv+GfTHzoPh02W5jzpe
+PnAttn/Lt24M2bKtKbBbfz+UQxagztuhbnkAHY3FCeGSbb0RfwsiVZBj0pCGwc3
eWwu44ay2RL8cd8r1bcFxAJ9isxml5cUD5wLuB6JTBsZ8fM4lh/9JSpqYM652OX+
3yMjwd0g
=3+01
-----END PGP SIGNATURE-----

--U7NLafZe7Bh9OCap--

--===============7721661413734058722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7721661413734058722==--
