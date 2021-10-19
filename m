Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 672C0432B35
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Oct 2021 02:29:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 203C4C5A4D3;
	Tue, 19 Oct 2021 00:29:31 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CC94C32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 00:29:28 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id 77so16995246qkh.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 17:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PNEumrUWFn8jGOfu00JJDfi7tTngCVlUsrD7BTiP3AY=;
 b=tEavTUlHrfeWU8jNkBUie+dqtDBk5vVXiJfX09SABWro1bfW2omBNIm/AMjPIazouY
 9WDdBi9HgHZ/7JRiWTt1PFQHDRUEVUFumJpDpCrCgoZwcNQqnsIm8nw86DMUJE0HxijK
 4hqZlTEB3imO0mo4DFrUw+taM33MpcmMShzIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PNEumrUWFn8jGOfu00JJDfi7tTngCVlUsrD7BTiP3AY=;
 b=Szd3SZb432GXMqGeUW7CN3m/gho4s60jX1D8TV3nPx+NDHLsQW/Z+MLj8IFD9hbv3L
 Pxg5WJZI1z36/6sZ6CtwcobgnoalORNtgnTS5fr3gnVYYpIBhJDW0K3FW2e6qagKPVO+
 nG6T/4yUEtgwCpLKTZnwSYmkkRx+/wYujHn24lt3Xsvh8ytQWWeoiDMvMNm9IRdHKAOr
 6ZADjXMZW+XpUB6LAnjyDegGrSw/1eJJ2s3BxaOle6xL3NsdDz2/pF9a+hLnt2mDROpE
 r4IFrbopvyGUgoWtk/ItjiYhMklyT+nAnlPy/WFT4yhyxd6Sxpu+Gy46nGdgMxhbtPQg
 W6eg==
X-Gm-Message-State: AOAM531vTDYYVBEuvcZBHV5Eyvi/PZht7Ncw+TdJFJ84WRADuyV/yNhm
 kXsFub3q0NmbcVCTbGZMBhGYZA==
X-Google-Smtp-Source: ABdhPJweYlOqUrdgQgsTYnZx9mqZDhPUofYjyqi/fbtsexH9YhtY+8U6qdL6WhZgMhYuwM3WddW0DA==
X-Received: by 2002:a05:620a:46aa:: with SMTP id
 bq42mr10394763qkb.291.1634603367963; 
 Mon, 18 Oct 2021 17:29:27 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-b5ac-d4ae-96e7-5d3d.res6.spectrum.com.
 [2603:6081:7b01:cbda:b5ac:d4ae:96e7:5d3d])
 by smtp.gmail.com with ESMTPSA id q22sm7228642qkj.64.2021.10.18.17.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:29:27 -0700 (PDT)
Date: Mon, 18 Oct 2021 20:29:24 -0400
From: Tom Rini <trini@konsulko.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <20211019002924.GW7964@bill-the-cat>
References: <20211015084243.285423-1-ilias.apalodimas@linaro.org>
 <20211018205033.GA3078606@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20211018205033.GA3078606@bill-the-cat>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 Zong Li <zong.li@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Heiko Schocher <hs@denx.de>,
 Asherah Connor <ashe@kivikakk.ee>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Wasim Khan <wasim.khan@nxp.com>,
 Harald Seiler <hws@denx.de>, Nandor Han <nandor.han@vaisala.com>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Green Wan <green.wan@sifive.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, sjg@chromium.org,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3] sandbox: Remove OF_HOSTFILE
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
Content-Type: multipart/mixed; boundary="===============6709964097850781137=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6709964097850781137==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="06N9xnU2hL237cv1"
Content-Disposition: inline


--06N9xnU2hL237cv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2021 at 04:50:33PM -0400, Tom Rini wrote:
> On Fri, Oct 15, 2021 at 11:42:40AM +0300, Ilias Apalodimas wrote:
>=20
> > OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
> > unique and rarely causes confusion,  we are better of having simpler
> > config options for the DTB.
> >=20
> > So let's replace that with the existing OF_BOARD.  U-Boot would then
> > have only three config options for the DTB origin.
> > - OF_SEPARATE, build separately from U-Boot
> > - OF_BOARD, board specific way of providing the DTB
> > - OF_EMBED embedded in the u-boot binary(should not be used in producti=
on)
> >=20
> > Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > ---
> > Note that this must be applied on top of
> > https://lore.kernel.org/u-boot/20211011210016.135929-1-ilias.apalodimas=
@linaro.org/
> > changes since v2:
> > - Rebased on top of the updated OF_BOARD patchset
> > Changes since v1:
> > - Added internal error value on board_fdt_blob_setup().  Arguably
> >   we can just check against NULL and simplify this even more if we
> >   don't care about the errno
> > - OF_BOARD is now default for sandbox builds
>=20
> With the previous series applied, this breaks xilinx_zynq_virt:
> https://source.denx.de/u-boot/u-boot/-/jobs/337428=20
>=20
> I had a little trouble in general getting the board to run locally, even
> without the patches, so I didn't debug further yet.

Here's another thing, that might be related.  The dependency series has
minor size changes, in basically expected platforms and places.  This
patch adds tons of size changes on virtually all platforms.  That might
provide a clue or two as to what's going on.

--=20
Tom

--06N9xnU2hL237cv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFuEWEACgkQFHw5/5Y0
tyynrAv/QLNgKIgKmDJ3axs1mj976nhCqaUcVM5QcRTVbUkEsSite20MgyQsJxS1
8I8pbOurHOvlROgddk+7UJ7pImgKYm36slWWcqal/mCm3LKRjm9YCBsLgug5LJ/w
sslBWtRDz+ldJ3ugNcmngerKFsO8Dap2Rehg5YMJPgpINbC3G0Dzm91p2N/tqHD1
PXLOohmfICGqYaMTcJ6gUmRYBI0j/n6ApW6SxMzkOVcPKXXPiMQpY2coLJWv9gXi
BihuxlnPvpcwpenT2uO9cJSk0XOev0eTFe/82rr11lMv3/dUAvNypkNUgEcKyNbd
0BFIFx8GVh7r1gT1VrQTkHwMNpThqk7lqZIm+KMrcypICGs6Odp7plyX9NNWUEDU
VhmQ/3LDq6wn68v/8PJfA5fCCln++ZXMnCH3lYFrPazDgBVZhaXpW1mDxFMRzApS
/AB1TS3w83mFmg023e03+aHSvl+3s1GyQP0+0k0zyexTfC03QRXT7j3oXXG8ftNw
wPYOSTo+
=BUCa
-----END PGP SIGNATURE-----

--06N9xnU2hL237cv1--

--===============6709964097850781137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6709964097850781137==--
