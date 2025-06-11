Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D541AD5E47
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Jun 2025 20:36:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFA2BC32E8E;
	Wed, 11 Jun 2025 18:36:00 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04785C36B13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 18:35:59 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-7304efb4b3bso110492a34.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 11:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1749666959; x=1750271759;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=84VjJxrj7PJF99Dl5mTGNuubhlMOkvq3sshzcr7zGnc=;
 b=sGGkRNN4efR0zs9wT/HRTwVJ1jZ3FNDGv6AXw/GJfsKhXrbtFHtQVpdQR4uBe1xJvB
 51rYpio1N1xTyd0fOs6ieUFZY6aJfLLd4WdbU1CSXud3VEA3MJyZycRym9PuWhY4xI5n
 H/e9QxsTqlLQF69qEQ+zLli1eImZV02eSNsRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749666959; x=1750271759;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=84VjJxrj7PJF99Dl5mTGNuubhlMOkvq3sshzcr7zGnc=;
 b=CRaNr97UVaG6Hdp2Wmg6L2JxLzdiUxuL5z3TqJ2jZXEFSAR7f7TTJmNMvYoBfl2T6I
 FQU3KfxrFWiGyNnz64fDHLJFll0MQmPZvBhh2O0SVHFe6DJhUnlVra6XQ8jKDgxnkDQp
 /eCpeTwzLMM3VdRhcwQEWPc3aW5hnB2ajtP8LJn9vihplxox641c7KljEEOJ+gld6Xvj
 SnI3RGr33S8w5Zbd7vFVCk5fvjCbCmG/ac9hn7TAW//gnyb4FWZEm452y9s+TAZQwxpo
 sWUWadntyaL9hQ2+T+PgZwCy0uEUzolq7piqIhkIbvtx+xpzbDvjCqiEhNtUZJWVYJLN
 hWlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/+6r9qVaNoiAbcO6Xj2w2mEGTrNi8DnsES5e4sxNnlsBRyBN79q5PFZ6FfrCpCEyXpR+h2k7LCc/5Ow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUpawuB78aG/GbsKoXtpWq60vf66DjD0c8mnA8eX6K1W5bCCIv
 cCD7CT5fmHGKOQfVjxmCxKtHrDshP1KSFK+ssaKXCUBVsDhy5gj4InqZdig09HTG8h0=
X-Gm-Gg: ASbGncu0djyKg4TiIZF5YdfIRuBxG9u5leyA7B5Nxny0ZcbBnFt2EmBdV10gnUaPIEg
 ypgcCTn8ms8LkzCNqVKChM3vBJ9I48oaOfRL8aG8nONoKtLvi527ZoPQbpOvid+DzfHewbpkQKg
 eGclzfNQ5M6y/e1XBNKNuKo/rU6Jor1GWylLQgWjkONb8SUQ9Szclr9sY+fZ5I80DicB9alAO5V
 fQxdci9wgIm+6pIIMF3SANXjAnJcapZxZzvspu6OGjzqsKp1oZEIRY9QnGEkbmrC70WRqfOJFx4
 7FEIPFTNExD3GxMqQ8b//ld3S0d+95eNXri3Avli6hMXhB1htZD7NY53GqL/f1z4uRHvUHldrKf
 rAKkdAQh4l2iZCP2o84jZ6Fo=
X-Google-Smtp-Source: AGHT+IENf5BNQ8l7LZOjMBgpsBfws9uVSZoijVRRS+6B9B1GfAGCkmU7F9f5vQjo8iMLkTCNlrElwg==
X-Received: by 2002:a05:6870:a552:b0:2cc:4516:afc6 with SMTP id
 586e51a60fabf-2ea96fe9378mr2788967fac.36.1749666958381; 
 Wed, 11 Jun 2025 11:35:58 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-42.totalplay.net.
 [189.203.100.42]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-610ef675dcbsm238955eaf.5.2025.06.11.11.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 11:35:57 -0700 (PDT)
Date: Wed, 11 Jun 2025 12:35:54 -0600
From: Tom Rini <trini@konsulko.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Message-ID: <20250611183554.GI1382132@bill-the-cat>
References: <aEbgxo0WUDPd-S8Z@sumit-X1>
 <CABGWkvox-1a1VSGjX8toQ=WsVTma0JcL8su=MGWaAwq4UZFkrQ@mail.gmail.com>
 <aEcAe80kh66cf0_c@sumit-X1> <20250609155019.GR1382132@bill-the-cat>
 <aEcGzCbZXajCthrh@sumit-X1> <20250609162239.GT1382132@bill-the-cat>
 <aEfyYd64P7txX7vS@sumit-X1> <20250610160454.GE1382132@bill-the-cat>
 <aElxoV5qvC-R0t3D@sumit-X1>
 <022e0516-137f-4a2c-8a92-c3da1a705e85@cherry.de>
MIME-Version: 1.0
In-Reply-To: <022e0516-137f-4a2c-8a92-c3da1a705e85@cherry.de>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Jerome Forissier <jerome.forissier@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Dillon Min <dillon.minfei@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sean Anderson <seanga2@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, u-boot@lists.denx.de,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
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
Content-Type: multipart/mixed; boundary="===============7871764654410976128=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7871764654410976128==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8KmqBFOk/3pc4h8w"
Content-Disposition: inline


--8KmqBFOk/3pc4h8w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 03:25:18PM +0200, Quentin Schulz wrote:
> Hi all,
>=20
> On 6/11/25 2:08 PM, Sumit Garg wrote:
> > On Tue, Jun 10, 2025 at 10:04:54AM -0600, Tom Rini wrote:
> > > On Tue, Jun 10, 2025 at 02:22:49PM +0530, Sumit Garg wrote:
> > > > On Mon, Jun 09, 2025 at 10:22:39AM -0600, Tom Rini wrote:
> > > > > On Mon, Jun 09, 2025 at 05:07:40PM +0100, Sumit Garg wrote:
> > > > > > On Mon, Jun 09, 2025 at 09:50:19AM -0600, Tom Rini wrote:
> > > > > > > On Mon, Jun 09, 2025 at 04:40:43PM +0100, Sumit Garg wrote:
> > > > > > > > On Mon, Jun 09, 2025 at 03:46:27PM +0200, Dario Binacchi wr=
ote:
> > > > > > > > > Hi Sumit,
> > > > > > > > >=20
> > > > > > > > > On Mon, Jun 9, 2025 at 3:25=E2=80=AFPM Sumit Garg <sumit.=
garg@kernel.org> wrote:
> > > > > > > > > >=20
> > > > > > > > > > Hi Patrice,
> > > > > > > > > >=20
> > > > > > > > > > On Mon, Jun 09, 2025 at 03:15:14PM +0200, Patrice CHOTA=
RD wrote:
> > > > > > > > > > >=20
> > > > > > > > > > >=20
> > > > > > > > > > > On 6/7/25 11:37, Dario Binacchi wrote:
> > > > > > > > > > > > The series adds support for stm32h747-discovery boa=
rd.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Detailed information can be found at:
> > > > > > > > > > > > https://www.st.com/en/evaluation-tools/stm32h747i-d=
isco.html
> > > > > > > > > > > >=20
> > > > > > > > > > > >=20
> > > > > > > > > > > > Dario Binacchi (9):
> > > > > > > > > > > >    ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]=
art_pins phandles
> > > > > > > > > > > >    dt-bindings: arm: stm32: add compatible for stm3=
2h747i-disco board
> > > > > > > > > > > >    dt-bindings: clock: stm32h7: rename USART{7,8}_C=
K to UART{7,8}_CK
> > > > > > > > > > > >    ARM: dts: stm32: add uart8 node for stm32h743 MCU
> > > > > > > > > > > >    ARM: dts: stm32: add pin map for UART8 controlle=
r on stm32h743
> > > > > > > > > > > >    ARM: dts: stm32: add an extra pin map for USART1=
 on stm32h743
> > > > > > > > > > > >    ARM: dts: stm32: support STM32h747i-disco board
> > > > > > > > > > > >    ARM: dts: stm32: add stm32h747i-disco-u-boot DTS=
 file
> > > > > > > > > > > >    board: stm32: add stm32h747-discovery board supp=
ort
> > > > > > > > > > >=20
> > > > > > > > > > >=20
> > > > > > > > > > > Hi Dario
> > > > > > > > > > >=20
> > > > > > > > > > > For the whole series
> > > > > > > > > > > Applied to u-boot-stm32/next
> > > > > > > > > >=20
> > > > > > > > > > Please give some time for other maintainers to review t=
his patch-set.
> > > > > > > > > > The dts/upstream patches in this series aren't clean ch=
erry pick from
> > > > > > > > > > upstream.
> > > > > > > > >=20
> > > > > > > > > All the commits are already in the mainline Linux kernel,=
 specifically
> > > > > > > > > in v6.16-rc1.
> > > > > > > > > If you're referring to the fact that the patches can't be=
 applied
> > > > > > > > > cleanly, I believe it's
> > > > > > > > > because the target path in the Linux kernel doesn't match=
 the one in U-Boot.
> > > > > > > > > In fact, the DTS files are located in two different relat=
ive paths.
> > > > > > > >=20
> > > > > > > > That's exactly why we have (refer here [1]):
> > > > > > > >=20
> > > > > > > > ./tools/update-subtree.sh pick dts <commit-id-to-be-picked>
> > > > > > > >=20
> > > > > > > > You should have waited v6.16-rc1 tag to be synced into
> > > > > > > > devicetree-rebasing [2] for the cherry-picks to work. This =
way of
> > > > > > > > manually patching dts/upstream is not allowed since it is g=
oing to break
> > > > > > > > DT syncs in one way or another.
> > > > > > > >=20
> > > > > > > > So I would suggest you to wait for v6.16-rc1 to land in DT =
rebasing tree
> > > > > > > > and then send v2 with proper cherry picked patches.
> > > > > > > >=20
> > > > > > > > [1] https://docs.u-boot.org/en/latest/develop/devicetree/co=
ntrol.html#resyncing-with-devicetree-rebasing
> > > > > > > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/devicet=
ree/devicetree-rebasing.git
> > > > > > >=20
> > > > > > > To be honest, I don't think this is a big deal. Git will be m=
erging
> > > > > > > based on content and not specific hashes. And in the case of =
conflicts I
> > > > > > > just copy the file from the tag to our tree.
> > > > > >=20
> > > > > > The essential problem here to me is we are going to allow manual
> > > > > > patching of dts/upstream tree given this example? How do we kee=
p track
> > > > > > if all that manual patching landed in Linux DT mainline? The ch=
erry
> > > > > > picks ensured that we always keep in sync with mainline.
> > > > > >=20
> > > > > > Lets take an example what if Git automatically resolved a merge=
 conflict
> > > > > > for you with duplicated content or if manually patching a DTS f=
ile
> > > > > > diverged from upstream and get unnoticed during DT syncs?
> > > > > >=20
> > > > > > IMHO, we should try to avoid manual patching of DT subtree othe=
rwise it
> > > > > > is hard to set a policy as to what level of manual patching is =
allowed
> > > > > > or not.
> > > > >=20
> > > > > Part of the problem here is that from the standpoint of applying =
posted
> > > > > patches there's no functional difference between what Dario did h=
ere and
> > > > > what could be done once v6.16-rc1-dts is tagged (if it's not alre=
ady).
> > > > > It's essentially a "manual patch" either way.
> > > >=20
> > > > Nope, there is a difference here. The cherry-pick from DT rebasing
> > > > allows the custodian to rather just cherry pick corresponding DT pa=
tches
> > > > rather than applying patches posted on mailing list. I usually do t=
hat
> > > > when reviewing dts/upstream patches if they can be cherry-picked cl=
eanly
> > > > or not. So there won't be manual patching in that process.
> > > >=20
> > > > ./tools/update-subtree.sh pick dts <commit-id-to-be-picked>
> > >=20
> > > Alright. I hadn't foreseen anyone doing that rather than "b4 {am,shaz=
am}
> > > msg-id" to grab the series.
> >=20
> > Maybe we need to have some custodian specific docs listing best
> > practices.
> >=20
>=20
> Or extend
>=20
> https://docs.u-boot.org/en/latest/develop/devicetree/control.html#where-d=
o-i-get-a-devicetree-file-for-my-board
> https://docs.u-boot.org/en/latest/develop/devicetree/control.html#resynci=
ng-with-devicetree-rebasing
>=20
> ?
>=20
> > >=20
> > > > > We make it clear that
> > > > > dts/upstream/ *only* gets changes that are in Linus' tree. If som=
eone
> > > > > tries to be sneaky and push something in that's not quite what's
> > > > > upstream, it will get stomped on later and there's not going to b=
e any
> > > > > sympathy for the now broken platform.
> > > >=20
> > > > For us the upstream sync path is via DT rebasing tree only. It usua=
lly
> > > > lags behind Linus' tree by maximum 1 week candence what I have noti=
ced.
> > > >=20
> > > > >=20
> > > > > Yes, we document saying to use the cherry-pick script, and that's=
 what
> > > > > people should do in general. But I don't think there's value in a=
dding a
> > > > > further delay between "in Linus' tree" and "in devicetree-rebasin=
g". In
> > > > > the linux kernel, there's thousands of people working on things a=
nd so
> > > > > strict rules can be understandable (someone will be running a bot=
 to
> > > > > look for "(cherry pick from commit $hash)" and fail things where =
$hash
> > > > > doesn't exist, makes sense). Here if the ST custodians are happy =
just
> > > > > verifying the kernel commit, OK, that's fine. Or if they want to =
wait,
> > > > > that's fine too. We can be a little relaxed and let custodians do=
 what
> > > > > they see as best.
> > > >=20
> > > > The reason we adopted OF_UPSTREAM was just to get rid of the manual=
 DT
> > > > patching and the syncs. So is it really that few days lag of DT reb=
asing
> > > > tree which is again pushing us towards manual DT patching? I am just
> > > > trying to understand the shortcomings that DT rebasing tree puts in
> > > > front of us.
> > >=20
> > > It's mainly that I want to be flexible. So long as we don't violate t=
he
> > > content rules (Linus' tree *only*) I don't want to hinder the people
> > > eager to now upstream U-Boot support for purely process reasons
> >=20
> > This flexibility has a cost associated to it which I hopefully was able
> > to clarify above. But finally it's your decision which prevails.
> >=20
> > BTW, DT rebasing has already got the v6.16-rc1 tag, so it was really
> > just 3 days gap. Quentin (CCed) has already done some proper cherry
> > picking from there [1].
> >=20
>=20
> Not sure why I was summoned here but I can give my (maybe undesired) 2 ce=
nts
> :)
>=20
> I (a contributor) **really** do not want to have hand-crafted patches in
> dts/upstream. Use tools/update-subtree.sh for patches in that tree. Only =
Tom
> is allowed to use pull because it's a mess to send a patch for it and he
> usually announces he's doing it and then pushes to the next branch direct=
ly,
> contributors can use pick instead. If a pick fails, backport everything
> needed for it to apply cleanly. Yes, this may be tedious. Make sure you do
> not break any other board as well.
>=20
> I was already surprised we have U-Boot specific files in dts/upstream (e.=
g.
> Makefiles :) ).
>=20
> 1) Doing it manually doesn't enforce the addition of the commit hash used
> for the backport/cherry-pick in the commit log, which may be problematic
> (how to quickly check that the patch contains what it should contain and =
not
> more, or less?). How to verify it actually was merged? In that state and =
not
> after other changes? Let's imagine an upstream patch that changes the
> SoC.dtsi and associated boards dts, if backporting manually one could be
> tempted to skip a conflicting board dts (because another commit needs to =
be
> picked before for it to apply cleanly). Also, until it's merged in master
> (which can take a long time depending where you are in the release cycle)
> there's no guarantee the patch is actually going to make it as is to the
> tree (it isn't unheard of to have reverts or even rebases in maintainer
> trees before sending a merge request to Linus).
>=20
> 2) If there are manual changes made to the patch that aren't upstreamed in
> the kernel (or dependencies (git context) are missing), if we diverge too
> much from upstream, Tom will have git conflicts when pulling new versions.
> How to resolve those conflicts will be interesting.
>=20
> 3) Worse, if there are non-upstreamed changes that aren't inducing any git
> conflict (via git context for example), then the merge/pull may not say
> anything about it and we'll carry non-upstream patches in dts/upstream.
>=20
> Maybe we should not even do a subtree pull/merge but erase everything and
> reimport everything every time we bump, to make sure 2 or 3) cannot happe=
n?
>=20
> For what it's worth, I've caught some (Rockchip) contributors sending
> patches to dts/upstream that weren't even sent to the kernel mailing list.
> That wasn't done on purpose but there are probably a few patches already
> that went through the cracks. I am not sure how we could enforce that (wh=
ich
> needs to be done with maintainer tools as there are already too many ways=
 to
> contribute to U-boot (patman, git-send-email, b4, etc...)) or even if we
> want to. But making dts/upstream the new arch/arm/dts/ (for ARM) directory
> doesn't make much sense to me.
>=20
> If you cannot wait for devicetree-rebasing to receive the new tag, do the
> changes in -u-boot.dtsi and revert the changes once we update dts/upstream
> to a newer tag (or cherry-pick once available)?
>=20
> v6.16-rc1 took a bit longer this time to reach devicetree-rebasing I thin=
k,
> but it landed this morning (UTC) so it isn't THAT long compared to the pu=
sh
> in master. We could ask devicetree-rebasing people to push the master bra=
nch
> more often to avoid the up-to 2-week delay between v6.15 and v6.16-rc1 for
> example.
>=20
> I have read nothing in this thread so this is absolutely not a jab at some
> contributor or maintainer in this series.
>=20
> On a side-note, I think we should add -s to tools/update-subtree.sh's git
> cherry-pick call to know who contributed the change to U-Boot (as the com=
mit
> author will be the same as in the kernel as far as I remember).
>=20
> To be fair, the whole process is a bit constraining, especially for new
> boards. You may have to wait up to ~2 months (a full kernel release cycle)
> to see a tag with the device tree for your board, and only then can you
> support the board in U-Boot with OF_UPSTREAM. In Rockchip we typically fo=
rce
> OF_UPSTREAM for new boards, but we also typically do not accept hand-craf=
ted
> git commits to dts/upstream. I don't know if it's deterring contributors =
but
> we are still getting some contributions here and there. Not sure how we
> should be handling that :/
>=20
> > [1] https://patchwork.ozlabs.org/project/uboot/list/?series=3D460450
> >=20
> > > (which
> > > happens, E Shattow on IRC was asking how to at least locally point
> > > dts/upstream at something else, at least for local testing).
> > >=20
> >=20
> > I would love to hear problems from people if that's for downstream
> > development too.
> >=20
>=20
> We can add things in https://docs.u-boot.org/en/latest/develop/devicetree=
/control.html#where-do-i-get-a-devicetree-file-for-my-board
> and https://docs.u-boot.org/en/latest/develop/devicetree/control.html#res=
yncing-with-devicetree-rebasing
> to be clearer on the limitations. Though til we enforce a check, this is
> just information.

Thank you for taking the time to provide your perspective on this
Quentin. And while I had hoped to be able to look over the history of
dts/upstream and see that it was just the Makefiles (which I don't think
we can avoid) being the difference between devicetree-rebasing and us,
that's not quite the case. So, yes, Sumit's opinion that we must
cherry-pick seems best. The documentation needs to be updated a bit, and
some more clear examples perhaps provided too. I've added some local
scripting that will complain at me about changes that don't have the
cherry-pick message or that the commit referenced doesn't exist. I may
spend a little time figuring out how to dump each commit and make sure
they're the same, but that too much get tricky.

--=20
Tom

--8KmqBFOk/3pc4h8w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmhJzIYACgkQFHw5/5Y0
tyzhSgv/fEL+ygCAJQiWdLQ0MbnZFj1fuRfM/NX2xc1r7DIsdLGzjbDSaUSARf/l
teQWB+E41KXPo/e4Qgpzk6WIDAx6p5uDD5d7VCtMgQvf3H+jTDPCp6jALPzR5vMw
5UyULMaaT6VoSxxWEcBlAEdEvwk7hqOLfk3Eu7/Gj7ALyrSF9fCl0VydAJgRu4+6
vBq0H5V/p742toENJlK8E1KyUXhbQXkL/6cbxpJVim3HtG2Ft2owihDP7h2zDpq/
ViPW6dSow8kxCn2oCdCijEDLjMIDMP/5hFwz5d77lw6mJPp66uq2BWHQ/JbziT90
u72uqDjyEnVMSlYNRt2vjg16K2f5sAXFDEORuoq4/zJ+hP50WLvhJSAIe9ZiGEMm
g2oX7Zk/hcUPesJpM+tR0gSbcP5gCYmpFkcDMl9NNWNjion7K8llRDolvYcy0e0m
a9X2x1Qvf1FFSnvBvq+IlRODvedqMayVlUWov4Ksp+1AVrD3oECa/icyCkuxXIq6
DAMz1CMC
=MmES
-----END PGP SIGNATURE-----

--8KmqBFOk/3pc4h8w--

--===============7871764654410976128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7871764654410976128==--
