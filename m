Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E644433AB8
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Oct 2021 17:36:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1332BC5C854;
	Tue, 19 Oct 2021 15:36:27 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B76CFC5C852
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 15:36:25 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id k29so196270qve.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=L3u0zmJce+8APvYNSgjg8d4glj4bzm1whSpCR5hfJ/Q=;
 b=qYEsMzf007heZC3n3o1i6FPGHQqiPv2mmWOV55C5VqBnBR0FToC702ySHrjwRK0SXB
 9EQGsQE6o5pnX+eOnn2g2Psix5PeJKZC887YFXHz1iUcRGS3b1n7yd19S0gTHmkyfFNv
 Cx+ohbh4MeDBP2oVgSU6Tx6puW69/5HQpyZ3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L3u0zmJce+8APvYNSgjg8d4glj4bzm1whSpCR5hfJ/Q=;
 b=H8v0OwgXOeGVKQRPA9oyb+CIfI7OLESV9QbVMaCxIVYPb2ecp3TJKVpb0LmzirhJvq
 +HJcxMYGv69MImNfEh9LIoJBdjXSu9FHicvJR+Ha+Gigrur7yJKzpdCC9I2QvENKnShz
 h4leWdfiVESVD3157LZKRunbL3+4d6cYUWz36PjU/BmfpuffNYV7cEaxMHImk3QXqNDS
 YlTW2pMCHgsQQn4c9A4+kNXARdmEkX9oxvfv2jIYq1/X3fJXLbxqxWdv4Lyq5CggBOj0
 14ZQkALH8tRwgg17jndxRcSDouMZe+XBDWbZ10uwm/dskc7wJlXDb4P7IOGlXgKvJZNs
 8s0w==
X-Gm-Message-State: AOAM530dx1SOurOqoXN1gvw8AxngQP0jIhU7nppIEO9P24EVj3QhWZwi
 CeMF9zeY3YdJt3lNHWKxxe3i0A==
X-Google-Smtp-Source: ABdhPJy5rCHi35C3Tx+AtwdE8oAD9TRT3SdrRkksNMmDQ4WnSrBzyz+kutp8xqLadSpCAxbVNYzoFQ==
X-Received: by 2002:a05:6214:308:: with SMTP id i8mr522215qvu.7.1634657784385; 
 Tue, 19 Oct 2021 08:36:24 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-b5ac-d4ae-96e7-5d3d.res6.spectrum.com.
 [2603:6081:7b01:cbda:b5ac:d4ae:96e7:5d3d])
 by smtp.gmail.com with ESMTPSA id c19sm7931984qkj.132.2021.10.19.08.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:36:22 -0700 (PDT)
Date: Tue, 19 Oct 2021 11:36:19 -0400
From: Tom Rini <trini@konsulko.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <20211019153619.GH7964@bill-the-cat>
References: <20211019130725.171193-1-ilias.apalodimas@linaro.org>
 <CAPnjgZ3TOc7aEBWx0JDy3L=b1C-u39A6gnFFjqT5U1L9H4dDug@mail.gmail.com>
 <20211019141733.GD7964@bill-the-cat>
 <CAC_iWjKLDA8eK+rGkYHnvH5je7RoOeXOruzKhr=MM3j-4VvxLA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC_iWjKLDA8eK+rGkYHnvH5je7RoOeXOruzKhr=MM3j-4VvxLA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Zong Li <zong.li@sifive.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
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
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v4] sandbox: Remove OF_HOSTFILE
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
Content-Type: multipart/mixed; boundary="===============0316620131881018566=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0316620131881018566==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oujlcGzp7w3KXnJ4"
Content-Disposition: inline


--oujlcGzp7w3KXnJ4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 06:30:59PM +0300, Ilias Apalodimas wrote:
> On Tue, 19 Oct 2021 at 17:17, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Tue, Oct 19, 2021 at 08:03:07AM -0600, Simon Glass wrote:
>=20
> [...]
>=20
> > >
> > > For some reason this still does not apply for me on -master. Can you
> > > please confirm the hash you are using?
> >
> > The hunk for scripts/Makefile.spl still fails (it failed on v3 as well),
> > but is easily fixed-up, fwiw.
>=20
> The reason is that I rebased on top of the prerequisite series, but
> failed to pull in -master.  As Tom says it's a single line of code
> that's in conflict.  Shall I send a v5 or will you pull that in Tom?

Well, what should that look like exactly?  It fails to apply cleanly on
current master.  I had swapped it to CONFIG_SANDBOX, but I gather from
Simon's comment it should be OF_BOARD?

--=20
Tom

--oujlcGzp7w3KXnJ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFu5fAACgkQFHw5/5Y0
tyzCSAwAh6kbfT0Yppsb9eu8e0D9k9cm3nKVLLytu4jYmywS+ztmfGB/UhQlgsjS
jKqknWMsX5xjlOyyTl+lQ2D13WcKA1XA/FY1X6XONTtiOWe4gbFX3TfK/ICBzHZH
oamZ5LGbQ2PN684lO7XQxAezRv0hT0Jf+4GoMU2eb0QNMRVRayEHEwFs8lqVAlFF
ZDkZlHK30ECTmdKXEK88rxbFxIMVSDLFvJjTS3GD/FOC0kHgVCN5Qizj0Pq+NxA0
ftmF+ENf5Wt7TY59KPMH3IRPNxtzWZtwfWyvuhtEnuWUul9FHaE6Zjn1hLtDN/ZT
wWPNiig59bP/PCJCgOSKhLFvM0Cmb27lXhDOWtsmwU3+WuJ23a8JJQXQoYLvK9Pv
Y9SyT5vzleN/ybwfJ5e6xguJfCQbt9UW0rb0M4eP93h/WBzPtT6t75ltPwk3XyUQ
cM5Z5mKoSHnvyuJH5qKYc7VVsVvlXskmXK37Ok0xll7es2Iuz+TUoKqtQZtZGkxf
wHsFXmW6
=k4zV
-----END PGP SIGNATURE-----

--oujlcGzp7w3KXnJ4--

--===============0316620131881018566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0316620131881018566==--
