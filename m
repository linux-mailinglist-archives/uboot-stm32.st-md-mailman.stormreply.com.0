Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 044C0AD3E33
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Jun 2025 18:05:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0E3DC36B38;
	Tue, 10 Jun 2025 16:05:01 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE2A2C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 16:04:59 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-2c6ed7efb1dso3426338fac.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 09:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1749571498; x=1750176298;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cd5YgHrDbS1eeelp/TocxnnKGRJqHNB7HhfdTfdDvuw=;
 b=H4CnvYKYc5PrDy1rQbgwrsctQHkBLg8AZKs14uisQRVMcHhq8xhnlh+g4wTeMCcCfE
 4cvWuN/xVYVhs58tOkxxiHVDzs+O8lXhPBAUwhInaiVP7Wz5Adm2fKnjjW5Hcjj41bVd
 yad1R+7+CSVZiO8J9h3GldZrQowBwODYd0/u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749571498; x=1750176298;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cd5YgHrDbS1eeelp/TocxnnKGRJqHNB7HhfdTfdDvuw=;
 b=W65OTVmemQpZX3ygVRowFgLQY6RBlYmpjOphageeQMG2Mp9mJkLRPKE4gC3/yi7F8m
 D9JHjDEP44NbIOisZqLlm9UrEAWLv8BNw6SkNzSKOBn7Q6B7BeC2HtEkUA4oX4bXWUXl
 2VDTt7Zv2uy+a8fnCqBno9FnEdOk5oXvVkrTUnkwh6OtuW1Sap+yc1Hm1m8VR8l/X41n
 kqRTkuF3zzHJTnd/kTEA3rR9G5NhjztXooYpjL7dbo3+so1ENZpN/1rrrFHFKmWT2oDM
 V32alfP97HWHZJd/XWYzjzx/ox8/i2sV+zqWyxB8K+4BYssCG2qKr0rGXC2w1fURp8hw
 inAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCvshA/aSD6wS8/jbHaF+03DaUbUGiwUGyDMM1cRyZwMeeNKB1hI58Z5zdva4PxjEHeMp1mwHmR7yGHw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0/nUZ24o9dJ4cBC/EM6cYKYh94bnFISbyhS8/9+p/hQ0mzQxZ
 kAWyVmCRuNYZGNBLqOtZY0NFrjGhRRq7hl5ERqRGd5FEO/xPMXOUPtC0xU89BvO/T9g=
X-Gm-Gg: ASbGncs1cP1KJzjX3zINVRmkmThpndh8UkcNjYR8NR42FVv1Tw2dSPajO4zmU0pBG6E
 w95UG5BcKZaS02pMjc+cC02zS9zgcOcj1EYkp3lHiuxpvZrlgBcc+hI8+ProBLnXyNWVqTtXJ+l
 ZNx6sKSlm75fp4RPiMwDqEFnENyS/waHP8X56EaUAYszFs25diL99g26yyHajk9QR+Xqss/JNq1
 MxdYWiFS/D2U1CJ4h0mbVwiR8aX7iDLn13rWHamDfY4zCnU0+KGaNHLkAige1SqU7KyXjkpbQwz
 E6K60np17nufGrV0t4Grw8sZR9j3tScLx53t2BY32omnJqqsB0UzphTf6m0FqyDTHC23ZIxnqi2
 EPrdW5JXQ3vLNte4HmhPfYzRY1yXaUZ4TRg==
X-Google-Smtp-Source: AGHT+IHrl1QcW7Yyb57ANmcLuHG2ZNlQOm/JHD9Lm4MUCdMY1sIq2TfewTRC22vOwgZ9OWaVr5atMw==
X-Received: by 2002:a05:6871:d113:b0:2c8:340d:1076 with SMTP id
 586e51a60fabf-2ea011e6f6bmr11170463fac.32.1749571498456; 
 Tue, 10 Jun 2025 09:04:58 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-42.totalplay.net.
 [189.203.100.42]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ea70259b3csm620326fac.49.2025.06.10.09.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 09:04:57 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:04:54 -0600
From: Tom Rini <trini@konsulko.com>
To: Sumit Garg <sumit.garg@kernel.org>
Message-ID: <20250610160454.GE1382132@bill-the-cat>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
 <dc8bb4a3-c465-4ae0-a61d-bb2f74a42b64@foss.st.com>
 <aEbgxo0WUDPd-S8Z@sumit-X1>
 <CABGWkvox-1a1VSGjX8toQ=WsVTma0JcL8su=MGWaAwq4UZFkrQ@mail.gmail.com>
 <aEcAe80kh66cf0_c@sumit-X1> <20250609155019.GR1382132@bill-the-cat>
 <aEcGzCbZXajCthrh@sumit-X1> <20250609162239.GT1382132@bill-the-cat>
 <aEfyYd64P7txX7vS@sumit-X1>
MIME-Version: 1.0
In-Reply-To: <aEfyYd64P7txX7vS@sumit-X1>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Jerome Forissier <jerome.forissier@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 linux-amarula@amarulasolutions.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sean Anderson <seanga2@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, u-boot@lists.denx.de,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/9] Support stm32h747-discovery board
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
Content-Type: multipart/mixed; boundary="===============0010616778977668464=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0010616778977668464==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sUqbLRjEVSJfZEPm"
Content-Disposition: inline


--sUqbLRjEVSJfZEPm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 02:22:49PM +0530, Sumit Garg wrote:
> On Mon, Jun 09, 2025 at 10:22:39AM -0600, Tom Rini wrote:
> > On Mon, Jun 09, 2025 at 05:07:40PM +0100, Sumit Garg wrote:
> > > On Mon, Jun 09, 2025 at 09:50:19AM -0600, Tom Rini wrote:
> > > > On Mon, Jun 09, 2025 at 04:40:43PM +0100, Sumit Garg wrote:
> > > > > On Mon, Jun 09, 2025 at 03:46:27PM +0200, Dario Binacchi wrote:
> > > > > > Hi Sumit,
> > > > > >=20
> > > > > > On Mon, Jun 9, 2025 at 3:25=E2=80=AFPM Sumit Garg <sumit.garg@k=
ernel.org> wrote:
> > > > > > >
> > > > > > > Hi Patrice,
> > > > > > >
> > > > > > > On Mon, Jun 09, 2025 at 03:15:14PM +0200, Patrice CHOTARD wro=
te:
> > > > > > > >
> > > > > > > >
> > > > > > > > On 6/7/25 11:37, Dario Binacchi wrote:
> > > > > > > > > The series adds support for stm32h747-discovery board.
> > > > > > > > >
> > > > > > > > > Detailed information can be found at:
> > > > > > > > > https://www.st.com/en/evaluation-tools/stm32h747i-disco.h=
tml
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Dario Binacchi (9):
> > > > > > > > >   ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pin=
s phandles
> > > > > > > > >   dt-bindings: arm: stm32: add compatible for stm32h747i-=
disco board
> > > > > > > > >   dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UA=
RT{7,8}_CK
> > > > > > > > >   ARM: dts: stm32: add uart8 node for stm32h743 MCU
> > > > > > > > >   ARM: dts: stm32: add pin map for UART8 controller on st=
m32h743
> > > > > > > > >   ARM: dts: stm32: add an extra pin map for USART1 on stm=
32h743
> > > > > > > > >   ARM: dts: stm32: support STM32h747i-disco board
> > > > > > > > >   ARM: dts: stm32: add stm32h747i-disco-u-boot DTS file
> > > > > > > > >   board: stm32: add stm32h747-discovery board support
> > > > > > > >
> > > > > > > >
> > > > > > > > Hi Dario
> > > > > > > >
> > > > > > > > For the whole series
> > > > > > > > Applied to u-boot-stm32/next
> > > > > > >
> > > > > > > Please give some time for other maintainers to review this pa=
tch-set.
> > > > > > > The dts/upstream patches in this series aren't clean cherry p=
ick from
> > > > > > > upstream.
> > > > > >=20
> > > > > > All the commits are already in the mainline Linux kernel, speci=
fically
> > > > > > in v6.16-rc1.
> > > > > > If you're referring to the fact that the patches can't be appli=
ed
> > > > > > cleanly, I believe it's
> > > > > > because the target path in the Linux kernel doesn't match the o=
ne in U-Boot.
> > > > > > In fact, the DTS files are located in two different relative pa=
ths.
> > > > >=20
> > > > > That's exactly why we have (refer here [1]):
> > > > >=20
> > > > > ./tools/update-subtree.sh pick dts <commit-id-to-be-picked>
> > > > >=20
> > > > > You should have waited v6.16-rc1 tag to be synced into
> > > > > devicetree-rebasing [2] for the cherry-picks to work. This way of
> > > > > manually patching dts/upstream is not allowed since it is going t=
o break
> > > > > DT syncs in one way or another.
> > > > >=20
> > > > > So I would suggest you to wait for v6.16-rc1 to land in DT rebasi=
ng tree
> > > > > and then send v2 with proper cherry picked patches.
> > > > >=20
> > > > > [1] https://docs.u-boot.org/en/latest/develop/devicetree/control.=
html#resyncing-with-devicetree-rebasing
> > > > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/de=
vicetree-rebasing.git
> > > >=20
> > > > To be honest, I don't think this is a big deal. Git will be merging
> > > > based on content and not specific hashes. And in the case of confli=
cts I
> > > > just copy the file from the tag to our tree.
> > >=20
> > > The essential problem here to me is we are going to allow manual
> > > patching of dts/upstream tree given this example? How do we keep track
> > > if all that manual patching landed in Linux DT mainline? The cherry
> > > picks ensured that we always keep in sync with mainline.
> > >=20
> > > Lets take an example what if Git automatically resolved a merge confl=
ict
> > > for you with duplicated content or if manually patching a DTS file
> > > diverged from upstream and get unnoticed during DT syncs?
> > >=20
> > > IMHO, we should try to avoid manual patching of DT subtree otherwise =
it
> > > is hard to set a policy as to what level of manual patching is allowed
> > > or not.
> >=20
> > Part of the problem here is that from the standpoint of applying posted
> > patches there's no functional difference between what Dario did here and
> > what could be done once v6.16-rc1-dts is tagged (if it's not already).
> > It's essentially a "manual patch" either way.
>=20
> Nope, there is a difference here. The cherry-pick from DT rebasing
> allows the custodian to rather just cherry pick corresponding DT patches
> rather than applying patches posted on mailing list. I usually do that
> when reviewing dts/upstream patches if they can be cherry-picked cleanly
> or not. So there won't be manual patching in that process.
>=20
> ./tools/update-subtree.sh pick dts <commit-id-to-be-picked>

Alright. I hadn't foreseen anyone doing that rather than "b4 {am,shazam}
msg-id" to grab the series.

> > We make it clear that
> > dts/upstream/ *only* gets changes that are in Linus' tree. If someone
> > tries to be sneaky and push something in that's not quite what's
> > upstream, it will get stomped on later and there's not going to be any
> > sympathy for the now broken platform.
>=20
> For us the upstream sync path is via DT rebasing tree only. It usually
> lags behind Linus' tree by maximum 1 week candence what I have noticed.
>=20
> >=20
> > Yes, we document saying to use the cherry-pick script, and that's what
> > people should do in general. But I don't think there's value in adding a
> > further delay between "in Linus' tree" and "in devicetree-rebasing". In
> > the linux kernel, there's thousands of people working on things and so
> > strict rules can be understandable (someone will be running a bot to
> > look for "(cherry pick from commit $hash)" and fail things where $hash
> > doesn't exist, makes sense). Here if the ST custodians are happy just
> > verifying the kernel commit, OK, that's fine. Or if they want to wait,
> > that's fine too. We can be a little relaxed and let custodians do what
> > they see as best.
>=20
> The reason we adopted OF_UPSTREAM was just to get rid of the manual DT
> patching and the syncs. So is it really that few days lag of DT rebasing
> tree which is again pushing us towards manual DT patching? I am just
> trying to understand the shortcomings that DT rebasing tree puts in
> front of us.

It's mainly that I want to be flexible. So long as we don't violate the
content rules (Linus' tree *only*) I don't want to hinder the people
eager to now upstream U-Boot support for purely process reasons (which
happens, E Shattow on IRC was asking how to at least locally point
dts/upstream at something else, at least for local testing).

--=20
Tom

--sUqbLRjEVSJfZEPm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmhIV6MACgkQFHw5/5Y0
tyxc6QwAsrJKo5Mz+VMunabhOCX4He/5SMeRP2gXcsuHZjK1cPvnhrn/YS4J4Kz0
EhZWf2SmCgAx5Rhcr/GPc0QfjWmVo7byFrdB9vHqhT2rOJVLKHpCncGW/OOSBkp4
ZC0SDLNSqiX0dQopAHw8Y4XKlvKu2SM/mB4orHNKGhWhH9UBAnm1jQJ77A4kxsBN
nGAWUjBMF7WwFVuU95CxF2Sj0iOrgJrkSVPGHPZoNEbHGSUQ+Dwvsv80tvY8nQHx
UhEKRuuE/vTJyMSzBMt9DbB8XuRqZxz1jKiXt1mD52f9JWjZBZQ7AlNHGcX8bcBG
Y9st+YG7ucze6RfbwFobmcE+waPqEUOoqQA2Obx0xg8op5Fd+TVEFuBTP25EqxAB
6hmWhJtBCGdccQ+yhyJAozB1hqc+iB5DfQfIO3Wmr3QERGQB5XT0/qoqujFFzBsD
ooHeORJDhEbKjQ4p586kYL3r6W0B5GoGR9RQ2QuwQTf88yFjsdFOkOd7dVVihe9a
rgiK+0AL
=CS21
-----END PGP SIGNATURE-----

--sUqbLRjEVSJfZEPm--

--===============0010616778977668464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0010616778977668464==--
