Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0A43E054
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Oct 2021 13:57:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49D8BC5E2B1;
	Thu, 28 Oct 2021 11:57:50 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C0CFC23E53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 11:57:49 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id ay10so325471qkb.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 04:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rKsSQXzKojBbGgkX4aHWLo8IA/eKR3Vb81Y0C+IJyrI=;
 b=rf0ltc9IBbOwRdrFVCOmVt2p2gpbGzrD1ZMckwoef9bbLWmann+6K/iznBKoOYdCqw
 DbzyzrEuC77V07CmW5u11Y3wTdmo8A5C+23DS4bajZ8YrgVv5k/9gzGjJU6Gpt7wF8qw
 bHzaDzGJ/cPz2J+3Hp0Aj3ADVptavpCTYe23M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rKsSQXzKojBbGgkX4aHWLo8IA/eKR3Vb81Y0C+IJyrI=;
 b=WakIg1fuorcpopXl1GvGk/j5vHv/RQrF2vlknnS+dfMjh8iwK9XB0pH1wkbx3MngcP
 80nSGwKqHGGEytQDIlFSufa/RTYlOVc4as7B08zgZGD31NOZQwrYBhfCpB2RgYrr1tI/
 o0iwzJKyFsUFwDoEndVROSiAvIsbSbI0cFQNCcHQyn2EDi9AOuf5mke3e8d1TucqziNF
 9/45sXGyYavSIDxS+yU+08ZjNs/2oIdkcMZI37DCvn8lgslDjd77KzpjZHkTKYuiLbgr
 midopcGPVl7N61pgpLcfbn3H158cAa2pw5ZiJjfcn60kFNWKb2s8ei0JqLntZp7c+qPz
 +4gg==
X-Gm-Message-State: AOAM532yQl9AUIrYCpDzFrNieU6js/txr5GgkxIiqcolr4Zh9MgcUX5j
 rIMIgK928p20aOd1z37GV4gAPA==
X-Google-Smtp-Source: ABdhPJxLMisICOs/qWVtKr9JT+Jj5WHirgOeIAVq/aqQCENlzjjzyXHR9WSTjy0q09lZq/12cEpMUQ==
X-Received: by 2002:a37:4647:: with SMTP id t68mr3057831qka.70.1635422268239; 
 Thu, 28 Oct 2021 04:57:48 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-015b-1704-43dd-8832.res6.spectrum.com.
 [2603:6081:7b01:cbda:15b:1704:43dd:8832])
 by smtp.gmail.com with ESMTPSA id y7sm1813387qtj.39.2021.10.28.04.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 04:57:47 -0700 (PDT)
Date: Thu, 28 Oct 2021 07:57:44 -0400
From: Tom Rini <trini@konsulko.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <20211028115744.GQ8284@bill-the-cat>
References: <20211026061238.114960-1-ilias.apalodimas@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211026061238.114960-1-ilias.apalodimas@linaro.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 Zong Li <zong.li@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Heiko Schocher <hs@denx.de>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Wasim Khan <wasim.khan@nxp.com>,
 Harald Seiler <hws@denx.de>, Dario Binacchi <dariobin@libero.it>,
 Nandor Han <nandor.han@vaisala.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Wolfgang Denk <wd@denx.de>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Green Wan <green.wan@sifive.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Peter Hoyes <Peter.Hoyes@arm.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, sjg@chromium.org,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v5] sandbox: Remove OF_HOSTFILE
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
Content-Type: multipart/mixed; boundary="===============2208199303400585248=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2208199303400585248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rKOZBEg9ux5nbisz"
Content-Disposition: inline


--rKOZBEg9ux5nbisz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 09:12:33AM +0300, Ilias Apalodimas wrote:

> OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
> unique and not causing any confusions,  we are better of having simpler
> config options for the DTB.
>=20
> So let's replace that with the existing OF_BOARD.  U-Boot would then
> have only three config options for the DTB origin.
> - OF_SEPARATE, build separately from U-Boot
> - OF_BOARD, board specific way of providing the DTB
> - OF_EMBED embedded in the u-boot binary(should not be used in production
>=20
> Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--rKOZBEg9ux5nbisz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF6kCsACgkQFHw5/5Y0
tywQogv+Iy1RM/b6mPBUU+a3FCXYnc4hzYN93mz76wDeg1XpIjQdxNLk1248uHIR
wvnznOwDvS+6VVw8ZoWBzjpIdFYzvoZP1sTRg5RK3peHY+FWAAxe30mYUPz51V7+
XC1Wv8dXI5MHFoKWA3OwFC5sP/DlMPX+QUnqfvHRt5CRPEX8JKPlBSanW0yn/2d3
7ASLzcItFTk2xLLyVCMLQCbBaiN5oghpkb6vNOUwjV3EAPe4HxK3HnwxvcxobVyF
/dd2BP9j1ykOsRK0x5EwJwHZgcsx9wR+xXILkV6yDiY7tAQ1sdTgM2lI7Ah1FlRT
Ib3YU8zs5XxA5gLxyYF3LP0n1EFZDt9msibXb5CSvxwgUSqBcRVJHr70Q3KiWuJL
1V8hpDOMSkrhAXKsqZfad3bVQMxcaBTBJeIzIvB9F5b82T99mQdHq4f1tViO0NoS
f7NDcIS5S85XArTWwLY3wF6AZeEO0e8EEz7bSOn3BmWdypt8qrL+ylfDCtq6NJTh
X/Cn6wU+
=AdcQ
-----END PGP SIGNATURE-----

--rKOZBEg9ux5nbisz--

--===============2208199303400585248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2208199303400585248==--
