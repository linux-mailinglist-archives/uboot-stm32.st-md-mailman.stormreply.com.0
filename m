Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7CDAD22F1
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 17:50:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1BE1C32E8F;
	Mon,  9 Jun 2025 15:50:26 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27C8DC349C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 15:50:25 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-407a5b577f8so1052886b6e.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Jun 2025 08:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1749484224; x=1750089024;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pQ2T59jEh3FY4rKWQ3N7iyBew40TzAqkUAuq+ZPiqhg=;
 b=pkVxJ6OAvriBm0S92a4qWbq4BsK4/h9ntlNqJXwvQkPXTlISBUPtyumaMUs3AUCGbm
 1yh5DG80PdtSRmENz21ZotIemd8K6U+IdLfG+aXyO5go3KhttPD3B3TUkm3rWv+DvxOx
 pj3ni8r0fP2d8FshsjlPa5NOUdLUu2GHyEbJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749484224; x=1750089024;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQ2T59jEh3FY4rKWQ3N7iyBew40TzAqkUAuq+ZPiqhg=;
 b=BlKyHOMPUmgJ+dSypkhc9gCp60DuEIV0nlQ/+VMo3cRJo/Do+DQwBqixs34qiVSECr
 60RyAcf81VJ5xJm8rVYWrQLGfq2oUf+uphA+hF1LMP7YV7kKyau6ABlt7bG8VdOA77j5
 P14hPiyvS3x8bn7kVu2Kt2wryEms+qPiXZXPlSaPaUvj83lh/L+zfHEpeeIFGc1ns4h6
 qKpF9fvRG+8SooHfzFo7wBT7YDNfNORkmJfv0i1XSrhhFlvL7J19j4Sk4p+b9mGasPx0
 KZuVFeYxUj0d7TvFPPw1mj3uwkRyqUvWfHniBNTf0h8vfWsbp52xjQoBFBTJHhmHFkMF
 0JZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrrZIG6chOH9V2+x8SQzMzQn3meeTyXZKebNdEnuHLVlkFrbwQSHDeoUo2SKdU/1L+s21KFJWc5iRlZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyTSr46cR84E9NmLt4Ndfy5SBmnQehEgXE3yOaSHuPescIbd9Zs
 puYeKLkvWCHL84kbkVtcNrXtHtImAdXaarBVr15NKD6faeHgQPocgev1l4ENeYGnsi8=
X-Gm-Gg: ASbGnctpPE30kJVIvmE9fu5com6MJUTl99CNAI7txbaM4snOJiMiz70CI/zwolDvWXV
 1POTKgdW2jEtcyIxda7nIB/aMFv93ujrtUDnmjdSX5sdprYHmexck/dAyWwnIHt/aIuxAXdhqfa
 IOFUXjpoCSmNDKqlLysjIRm/pNKrAmF9uayeKrIEpPBqdfyxAhvMFH5RDnEuLWs365gLxVJl6dq
 OnwFb09UuuLT4Zar4PFJ6HIAUbNXRN1UwC53mo+C2kTrkT0M2wqTTflkLo7UpJCqWgdxCmM00Mn
 kxirV3CfhvfeCwDT5W0Zu0APFR68cLAdCH+0EXda676wF6PC6Y3bjx7bjT144vxGUb5TFlBnzFb
 qLjXi7h1lKAViuJUgUtreEV8=
X-Google-Smtp-Source: AGHT+IHMJe10cNXdXis98uD/mhK6q/pKBttMlUJeH29yJkLVrCPeqN/2glF5UkYDn312fwxNf0X0+A==
X-Received: by 2002:a05:6808:2804:b0:406:3a0c:1801 with SMTP id
 5614622812f47-409051faa7bmr7909118b6e.20.1749484223749; 
 Mon, 09 Jun 2025 08:50:23 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-42.totalplay.net.
 [189.203.100.42]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-409069f5c80sm1869049b6e.31.2025.06.09.08.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:50:22 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:50:19 -0600
From: Tom Rini <trini@konsulko.com>
To: Sumit Garg <sumit.garg@kernel.org>
Message-ID: <20250609155019.GR1382132@bill-the-cat>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
 <dc8bb4a3-c465-4ae0-a61d-bb2f74a42b64@foss.st.com>
 <aEbgxo0WUDPd-S8Z@sumit-X1>
 <CABGWkvox-1a1VSGjX8toQ=WsVTma0JcL8su=MGWaAwq4UZFkrQ@mail.gmail.com>
 <aEcAe80kh66cf0_c@sumit-X1>
MIME-Version: 1.0
In-Reply-To: <aEcAe80kh66cf0_c@sumit-X1>
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
Content-Type: multipart/mixed; boundary="===============3380027052325370457=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3380027052325370457==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kgMtOV1OLw/tHJl9"
Content-Disposition: inline


--kgMtOV1OLw/tHJl9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 04:40:43PM +0100, Sumit Garg wrote:
> On Mon, Jun 09, 2025 at 03:46:27PM +0200, Dario Binacchi wrote:
> > Hi Sumit,
> >=20
> > On Mon, Jun 9, 2025 at 3:25=E2=80=AFPM Sumit Garg <sumit.garg@kernel.or=
g> wrote:
> > >
> > > Hi Patrice,
> > >
> > > On Mon, Jun 09, 2025 at 03:15:14PM +0200, Patrice CHOTARD wrote:
> > > >
> > > >
> > > > On 6/7/25 11:37, Dario Binacchi wrote:
> > > > > The series adds support for stm32h747-discovery board.
> > > > >
> > > > > Detailed information can be found at:
> > > > > https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> > > > >
> > > > >
> > > > > Dario Binacchi (9):
> > > > >   ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandl=
es
> > > > >   dt-bindings: arm: stm32: add compatible for stm32h747i-disco bo=
ard
> > > > >   dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UART{7,8}_=
CK
> > > > >   ARM: dts: stm32: add uart8 node for stm32h743 MCU
> > > > >   ARM: dts: stm32: add pin map for UART8 controller on stm32h743
> > > > >   ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
> > > > >   ARM: dts: stm32: support STM32h747i-disco board
> > > > >   ARM: dts: stm32: add stm32h747i-disco-u-boot DTS file
> > > > >   board: stm32: add stm32h747-discovery board support
> > > >
> > > >
> > > > Hi Dario
> > > >
> > > > For the whole series
> > > > Applied to u-boot-stm32/next
> > >
> > > Please give some time for other maintainers to review this patch-set.
> > > The dts/upstream patches in this series aren't clean cherry pick from
> > > upstream.
> >=20
> > All the commits are already in the mainline Linux kernel, specifically
> > in v6.16-rc1.
> > If you're referring to the fact that the patches can't be applied
> > cleanly, I believe it's
> > because the target path in the Linux kernel doesn't match the one in U-=
Boot.
> > In fact, the DTS files are located in two different relative paths.
>=20
> That's exactly why we have (refer here [1]):
>=20
> ./tools/update-subtree.sh pick dts <commit-id-to-be-picked>
>=20
> You should have waited v6.16-rc1 tag to be synced into
> devicetree-rebasing [2] for the cherry-picks to work. This way of
> manually patching dts/upstream is not allowed since it is going to break
> DT syncs in one way or another.
>=20
> So I would suggest you to wait for v6.16-rc1 to land in DT rebasing tree
> and then send v2 with proper cherry picked patches.
>=20
> [1] https://docs.u-boot.org/en/latest/develop/devicetree/control.html#res=
yncing-with-devicetree-rebasing
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree=
-rebasing.git

To be honest, I don't think this is a big deal. Git will be merging
based on content and not specific hashes. And in the case of conflicts I
just copy the file from the tag to our tree.

--=20
Tom

--kgMtOV1OLw/tHJl9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmhHArMACgkQFHw5/5Y0
tyz3+wv+PkV/p4+PEflB8lFyxxgIPmzv8TbHXpn0C6Mf1FtbCnCI9ZHijpMtv6tB
cY+V3Oo/8/iM00EJQ845xRTbfyRyJkCrKcepzyAyZudj6A/qRSrE8VvCYmMkVrLv
2d7l12ahO7QIUnbd7MsLNBX6fWrKCJXn6yNfAgTio5te07rsoAfwRvx8DhCPzPNr
Zmacq6pKNfKcR3uawatdVylvHel5pkzZtM4mIKjrdR9jCQFnFwJUDc2i+CuGUXhj
fYSyBh1g0464BVyluHyxCllJc5awdZA6+8g8+dxxPV7B2WOfOYG6gTYirwgbtIT5
qx+lGf5iSTUQPIW0PjrRoD/YkjjmaX3GEdXhg004FdMIRe604veJsb3jWpyaYkpQ
B3+lQ9+WOCX2ESPyghNAWBfCQ9yQ5o4uPpIe3g3Xb+UYQzjEkIk3dRKltlOCPL5/
q3ZRF0X+0p6gtasPMV/N2aEMDcSsm+8HVBZ97gaezTr2YTHk0wXzFEKSnO+AcB5s
emo+isvl
=0LBQ
-----END PGP SIGNATURE-----

--kgMtOV1OLw/tHJl9--

--===============3380027052325370457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3380027052325370457==--
