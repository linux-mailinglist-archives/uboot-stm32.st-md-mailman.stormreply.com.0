Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A11433666
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Oct 2021 14:54:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67B40C5C84E;
	Tue, 19 Oct 2021 12:54:41 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 155E9C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 12:54:40 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id v10so12165445qvb.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 05:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=B1aja6JBb7zwwE/ZK0JwDLQ7B7j8tBci/lYayXBOJJE=;
 b=mM5ESYSmqCJFojnTlOI4KLnEC2dctSjG0Shuw1tVo237DGQw3p1aVRkJ+qbNnQ+Vw2
 oiOBqyeELexOtJ5eVj3Q7X87D7llj5QmoFwYwYJPhcAa9wnL6X2/Pq8NLUGjSm4bbmst
 wd2WCwzhZTjXRLfuc89qjS9nwuC3j4lH+pWhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B1aja6JBb7zwwE/ZK0JwDLQ7B7j8tBci/lYayXBOJJE=;
 b=VdhKAKQrgBhxKPgXvMMFc3FWMTQco+E/xwSQk21h0puUQ3WxxmF5+0v3p5gXQh0FI3
 Y0QfzXtJGrR987cw3Pixq1y9gGXiZvspX3Yzx2XOwYFBRtiwfeFUmtnPwRxo3oC9JX27
 Tpiojaw3n0LNteoF14dnFk7j6p0mIuwquWidA4iEbAn1t1Dt5ZUOEqy8mtXxbYCHU8JQ
 SM35NHiJyGHgTENNOP3nmmEGLJZsH1h6R3pXsrQCz/y6MEWwpQqQshKi/LTsjfKBfl1s
 jA8XSLRrQi0c5bVrlgx8JmGT2HGY7KuYk7KvLLqZgStU5VgbDcNCGW0dQApAM4IS1azM
 OS0Q==
X-Gm-Message-State: AOAM533rUFiZSEAsxGANlSqkAraQwzoGlPMSHOVFJX21aRR2vk8d0pPo
 dVOKXImsdDniA5gyFBQ/MLNqZg==
X-Google-Smtp-Source: ABdhPJwdQYBqkKO46qL/0B53/QHXGwjhWmKPUjZ3UVrn3qFsockPt2oL6sfbf2czO+FeqDcGSNC3Vg==
X-Received: by 2002:ad4:590e:: with SMTP id ez14mr31210255qvb.62.1634648078979; 
 Tue, 19 Oct 2021 05:54:38 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-b5ac-d4ae-96e7-5d3d.res6.spectrum.com.
 [2603:6081:7b01:cbda:b5ac:d4ae:96e7:5d3d])
 by smtp.gmail.com with ESMTPSA id u16sm8584448qki.47.2021.10.19.05.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 05:54:38 -0700 (PDT)
Date: Tue, 19 Oct 2021 08:54:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <20211019125434.GX7964@bill-the-cat>
References: <20211015084243.285423-1-ilias.apalodimas@linaro.org>
 <20211018205033.GA3078606@bill-the-cat>
 <20211019002924.GW7964@bill-the-cat> <YW56KurTNFyaMnAY@apalos.home>
 <YW6pJHHgbPI85uui@apalos.home>
MIME-Version: 1.0
In-Reply-To: <YW6pJHHgbPI85uui@apalos.home>
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
Content-Type: multipart/mixed; boundary="===============4504630405475150494=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4504630405475150494==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0BDWBegILtPtvHW0"
Content-Disposition: inline


--0BDWBegILtPtvHW0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 02:16:52PM +0300, Ilias Apalodimas wrote:
> On Tue, Oct 19, 2021 at 10:56:26AM +0300, Ilias Apalodimas wrote:
> > On Mon, Oct 18, 2021 at 08:29:24PM -0400, Tom Rini wrote:
> > > On Mon, Oct 18, 2021 at 04:50:33PM -0400, Tom Rini wrote:
> > > > On Fri, Oct 15, 2021 at 11:42:40AM +0300, Ilias Apalodimas wrote:
> > > >=20
> > > > > OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
> > > > > unique and rarely causes confusion,  we are better of having simp=
ler
> > > > > config options for the DTB.
> > > > >=20
> > > > > So let's replace that with the existing OF_BOARD.  U-Boot would t=
hen
> > > > > have only three config options for the DTB origin.
> > > > > - OF_SEPARATE, build separately from U-Boot
> > > > > - OF_BOARD, board specific way of providing the DTB
> > > > > - OF_EMBED embedded in the u-boot binary(should not be used in pr=
oduction)
> > > > >=20
> > > > > Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > > > ---
> > > > > Note that this must be applied on top of
> > > > > https://lore.kernel.org/u-boot/20211011210016.135929-1-ilias.apal=
odimas@linaro.org/
> > > > > changes since v2:
> > > > > - Rebased on top of the updated OF_BOARD patchset
> > > > > Changes since v1:
> > > > > - Added internal error value on board_fdt_blob_setup().  Arguably
> > > > >   we can just check against NULL and simplify this even more if we
> > > > >   don't care about the errno
> > > > > - OF_BOARD is now default for sandbox builds
> > > >=20
> > > > With the previous series applied, this breaks xilinx_zynq_virt:
> > > > https://source.denx.de/u-boot/u-boot/-/jobs/337428=20
> > > >=20
> > > > I had a little trouble in general getting the board to run locally,=
 even
> > > > without the patches, so I didn't debug further yet.
> > >=20
> > > Here's another thing, that might be related.  The dependency series h=
as
> > > minor size changes, in basically expected platforms and places.  This
> > > patch adds tons of size changes on virtually all platforms.  That mig=
ht
> > > provide a clue or two as to what's going on.
> >=20
> > I'll have a look. What changes here is an extra argument to preserve the
> > errno (which we can get rid of).
> >=20
> > >=20
> >=20
> > Is it the OF_HOSTFILE patch that breaks it?  There's one thing this pat=
ch
> > changes in functionality.  In the new version fdtdec_setup() will retur=
n an
> > error if the DTB is not found. =20
> > Can I reproduce this locally?
>=20
> Right, I did find a way to reproduce it locally.  It's indeed the change =
in
> fdtdec_setup() that break this platform.  Specifically
> board_fdt_blob_setup() in board/xilinx/common/board.c will return -ENXIO =
if
> the DTB is not found.  Apparently that's ok for this platform so returning
> 0 there fixes the boot. It's also another reason why we need the errno
> instead of just checking the pointer ....
> Want me to send a v4 of the OF_HOSTFILE version?

Yes please, thanks.

--=20
Tom

--0BDWBegILtPtvHW0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFuwAcACgkQFHw5/5Y0
tyyMZwv9Eq2CxM0b3FnXjCwknoo4XkP5zQ/0tqIp/KO3X2qlusRBKYXtNy+lN2fZ
cXM/xDSZDPW9Bcql8Jq3iJkiNtKm72eHJ2nWYpDujQ4Rc0l5cbZtYHZhk0ksgej2
DpdwG+n64rv6Q6v7gHCt6tuYbh8g+WQkRQHjSL3R4IQUh8SWdytU+M6zeHIlHum5
GAN+3rNp7o1JUw751BPjfIFCPT8VlgRli69lANAxS2yRsBpM2+QRXqkf7jrhfWHF
lh2D8NvSKhOhJKg+QJ6SrPtMR77EbTmNNij7xCyuM7n43YUBqJFZEF2oOvZHeLy8
PjVBXHj7kUz9tRU8qRW5MUiQMLMP9xM4tGR46/DJzbtyd9aMZozuCrypckj59NKO
xNY3ZdrB5uN1gZL+/cQY/p1DyCOYjHHnDKKKknplyYZsxVLfSe1TbgANxluOUYzW
XQ12sqmTHyTo2KSV1+EAg/BKp2hWyqH5c1l0OtLdvOhZvCIArslQo3lCup11t8ED
/YJnGoR4
=fdT2
-----END PGP SIGNATURE-----

--0BDWBegILtPtvHW0--

--===============4504630405475150494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4504630405475150494==--
