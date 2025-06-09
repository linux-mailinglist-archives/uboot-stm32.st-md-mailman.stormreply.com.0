Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF85AD23B5
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 18:22:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B42F2C32E92;
	Mon,  9 Jun 2025 16:22:45 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73373C349C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 16:22:44 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-2ea34731c5dso997096fac.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Jun 2025 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1749486163; x=1750090963;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/HDH5EqaoG2G/SeODK6F9H/o24tlGfFInDKDDAqDRnw=;
 b=YFutloUBSIGvJqq6zhV0VJVd1RgaOfk8cik1dzRAxusJng2ZpWEl6mtNNnqITBrNgF
 4mYQIlwpnU2JxlAZMSkIiLgj3z1KB2JAPG/bDRQG9pri0rliCzhRWozFckKVhOTomhQG
 u7+oVbG4LseWGkXKDUiJ7jybBu3km1GCx+ay0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749486163; x=1750090963;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/HDH5EqaoG2G/SeODK6F9H/o24tlGfFInDKDDAqDRnw=;
 b=FCKj5KzMPrOoTwbSe+TvtWehUyDftQRhQkq/Tgj7QNfo6S8RsciBsfyEo1KHBtdDm5
 0DhwrTXiNSuauBz9TvJ0/hp+aR/Vdfl6xi/4KSvM7QWicynsXPO48fUKH0DezCMgnVgc
 FjWXnUwWcChf6XP8qmHp20HgYZAiwtHFF326HKOS/5F+lNsqA3EetG/HCx7ShPAEgCSv
 Xt6YanwdcgTQRVQCvqgLMIhGQhZgauL3kF5dUo2UyLhG5ocQJcTtNU49nb9+5434ydlG
 BtXz8Uc4bsRbHqt6WoVZtBakTJXEMD8prha6jOKfCA0IYwMQvCBggajq0bEkM1/hA/Pr
 3OLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaWJJ5LX/4/7nCfHwjGuZR+0dKNnudoKhZsmxSzwouippQB0zlfUBvSGX2RBUmuzsSajCuuF6IqBS9Ng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz7ATsnqwXeXwQI25JJEyv87QatHDOR9aagpx5/dmJtLCIFgmG5
 qgFcwdLl8Zh5YtgHzdQ00G9gcYp4KteqmFtzSt4gjz4zJYvIk99OUMmoh6siSDvOK2A=
X-Gm-Gg: ASbGncv/gEDxQoRUuebfq26vEtOy6m93VtRvmDMsorFiHCfdLa+ytYaPTlEu99JzD0R
 qbtF+gK6+tUss+uBzKp/Xvmr9xfmCspT4lveTFV4aMEooLJnwnH+zylK3HZEDdxwUtypRltxrSz
 kP6NK1M6OASAz2BWLaRVjdjEFVRGikNycoORCd3TkXAYtqE1b3Ms7lIcrr3B7k3kYj7W90oRLrd
 FHs8ItDs8ieAJcCHpt13+i3AxjI1+Wy6WhnxAR/ugkH3XcuGljhoSBgM0QPIQtDxPImriR/XIq+
 larAxRvkUUFZV9uSPXDqfi1FGR+xC4/h7ElW/+KpyLgmlAeEZ6jO+rUJHasAmNIdn+LK7gI/GL0
 VW9NtMzXANe3e
X-Google-Smtp-Source: AGHT+IGmcPgvaeafR4gDWPsdNmoJ3kkB3Pe9rmlI6BjAT/Yj1FLakMcekfw7bqllLknOyjTbPT3gdw==
X-Received: by 2002:a05:6871:d101:b0:2d8:957a:5163 with SMTP id
 586e51a60fabf-2ea00817781mr8829799fac.10.1749486162990; 
 Mon, 09 Jun 2025 09:22:42 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-42.totalplay.net.
 [189.203.100.42]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ea642a55b1sm329923fac.7.2025.06.09.09.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 09:22:42 -0700 (PDT)
Date: Mon, 9 Jun 2025 10:22:39 -0600
From: Tom Rini <trini@konsulko.com>
To: Sumit Garg <sumit.garg@kernel.org>
Message-ID: <20250609162239.GT1382132@bill-the-cat>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
 <dc8bb4a3-c465-4ae0-a61d-bb2f74a42b64@foss.st.com>
 <aEbgxo0WUDPd-S8Z@sumit-X1>
 <CABGWkvox-1a1VSGjX8toQ=WsVTma0JcL8su=MGWaAwq4UZFkrQ@mail.gmail.com>
 <aEcAe80kh66cf0_c@sumit-X1> <20250609155019.GR1382132@bill-the-cat>
 <aEcGzCbZXajCthrh@sumit-X1>
MIME-Version: 1.0
In-Reply-To: <aEcGzCbZXajCthrh@sumit-X1>
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
Content-Type: multipart/mixed; boundary="===============7392115171805294008=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7392115171805294008==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O5az6EqOTJVqen05"
Content-Disposition: inline


--O5az6EqOTJVqen05
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 05:07:40PM +0100, Sumit Garg wrote:
> On Mon, Jun 09, 2025 at 09:50:19AM -0600, Tom Rini wrote:
> > On Mon, Jun 09, 2025 at 04:40:43PM +0100, Sumit Garg wrote:
> > > On Mon, Jun 09, 2025 at 03:46:27PM +0200, Dario Binacchi wrote:
> > > > Hi Sumit,
> > > >=20
> > > > On Mon, Jun 9, 2025 at 3:25=E2=80=AFPM Sumit Garg <sumit.garg@kerne=
l.org> wrote:
> > > > >
> > > > > Hi Patrice,
> > > > >
> > > > > On Mon, Jun 09, 2025 at 03:15:14PM +0200, Patrice CHOTARD wrote:
> > > > > >
> > > > > >
> > > > > > On 6/7/25 11:37, Dario Binacchi wrote:
> > > > > > > The series adds support for stm32h747-discovery board.
> > > > > > >
> > > > > > > Detailed information can be found at:
> > > > > > > https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> > > > > > >
> > > > > > >
> > > > > > > Dario Binacchi (9):
> > > > > > >   ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins ph=
andles
> > > > > > >   dt-bindings: arm: stm32: add compatible for stm32h747i-disc=
o board
> > > > > > >   dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UART{7=
,8}_CK
> > > > > > >   ARM: dts: stm32: add uart8 node for stm32h743 MCU
> > > > > > >   ARM: dts: stm32: add pin map for UART8 controller on stm32h=
743
> > > > > > >   ARM: dts: stm32: add an extra pin map for USART1 on stm32h7=
43
> > > > > > >   ARM: dts: stm32: support STM32h747i-disco board
> > > > > > >   ARM: dts: stm32: add stm32h747i-disco-u-boot DTS file
> > > > > > >   board: stm32: add stm32h747-discovery board support
> > > > > >
> > > > > >
> > > > > > Hi Dario
> > > > > >
> > > > > > For the whole series
> > > > > > Applied to u-boot-stm32/next
> > > > >
> > > > > Please give some time for other maintainers to review this patch-=
set.
> > > > > The dts/upstream patches in this series aren't clean cherry pick =
=66rom
> > > > > upstream.
> > > >=20
> > > > All the commits are already in the mainline Linux kernel, specifica=
lly
> > > > in v6.16-rc1.
> > > > If you're referring to the fact that the patches can't be applied
> > > > cleanly, I believe it's
> > > > because the target path in the Linux kernel doesn't match the one i=
n U-Boot.
> > > > In fact, the DTS files are located in two different relative paths.
> > >=20
> > > That's exactly why we have (refer here [1]):
> > >=20
> > > ./tools/update-subtree.sh pick dts <commit-id-to-be-picked>
> > >=20
> > > You should have waited v6.16-rc1 tag to be synced into
> > > devicetree-rebasing [2] for the cherry-picks to work. This way of
> > > manually patching dts/upstream is not allowed since it is going to br=
eak
> > > DT syncs in one way or another.
> > >=20
> > > So I would suggest you to wait for v6.16-rc1 to land in DT rebasing t=
ree
> > > and then send v2 with proper cherry picked patches.
> > >=20
> > > [1] https://docs.u-boot.org/en/latest/develop/devicetree/control.html=
#resyncing-with-devicetree-rebasing
> > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/device=
tree-rebasing.git
> >=20
> > To be honest, I don't think this is a big deal. Git will be merging
> > based on content and not specific hashes. And in the case of conflicts I
> > just copy the file from the tag to our tree.
>=20
> The essential problem here to me is we are going to allow manual
> patching of dts/upstream tree given this example? How do we keep track
> if all that manual patching landed in Linux DT mainline? The cherry
> picks ensured that we always keep in sync with mainline.
>=20
> Lets take an example what if Git automatically resolved a merge conflict
> for you with duplicated content or if manually patching a DTS file
> diverged from upstream and get unnoticed during DT syncs?
>=20
> IMHO, we should try to avoid manual patching of DT subtree otherwise it
> is hard to set a policy as to what level of manual patching is allowed
> or not.

Part of the problem here is that from the standpoint of applying posted
patches there's no functional difference between what Dario did here and
what could be done once v6.16-rc1-dts is tagged (if it's not already).
It's essentially a "manual patch" either way. We make it clear that
dts/upstream/ *only* gets changes that are in Linus' tree. If someone
tries to be sneaky and push something in that's not quite what's
upstream, it will get stomped on later and there's not going to be any
sympathy for the now broken platform.

Yes, we document saying to use the cherry-pick script, and that's what
people should do in general. But I don't think there's value in adding a
further delay between "in Linus' tree" and "in devicetree-rebasing". In
the linux kernel, there's thousands of people working on things and so
strict rules can be understandable (someone will be running a bot to
look for "(cherry pick from commit $hash)" and fail things where $hash
doesn't exist, makes sense). Here if the ST custodians are happy just
verifying the kernel commit, OK, that's fine. Or if they want to wait,
that's fine too. We can be a little relaxed and let custodians do what
they see as best.

--=20
Tom

--O5az6EqOTJVqen05
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmhHCksACgkQFHw5/5Y0
tywD1gwAo7WR+HUndyQw3xkLZTkSqBGtuUl223Tp/5yvx9jT/tsJ+iAnkzMTvSky
iFfbNkr8g76UyXIg9AXfVlp0yOhJCRZ4YnN2UiPVzGAFeghYFNiIVvqGutY6ih+C
U/XHgcIj3lGgBPHnr1y+BECtBexI3WWrytRAcUFvG0F3TjT9ETGuOPsPjrElqw1e
VB7phj0VFuIdwLicVsexZ8hI5fSYs/RO1KRyC9gx/Zznn3taiMPkFUhDEeahWMET
axv3ERP9nI6eFzXojon/ZFHrk11QKGTf0vSsPjYb/QBCCCTkmExqnGu/Wwohj6o4
KS4z4wmtPmEWzMpyro3Al5pEVNnWxHmAaRo++ARS79dw7brcy7hg/imrWT3H6U1o
qvPrc31KXucAE5SdSpAnbW8csOaagQZpHyIVrs4XU5pbqXcle+N0qT/zdGmbErVb
bRjvLuHuY635+UEJbioRjYhj8WU1kO4O/zpvTDf8lyMn5Uc4ovhEhXp129/Ql2Pu
8Wx+mcgy
=Mzi/
-----END PGP SIGNATURE-----

--O5az6EqOTJVqen05--

--===============7392115171805294008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7392115171805294008==--
