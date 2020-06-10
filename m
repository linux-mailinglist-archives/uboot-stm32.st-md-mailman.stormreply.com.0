Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E9A1F5E36
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jun 2020 00:17:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75E4CC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 22:17:54 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA9E3C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 22:17:51 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id w3so3763940qkb.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 15:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5r+8URYZJJcoMTsx3Jsv0fosCUZBc2qwjE1VPx0QvSI=;
 b=Ie3wNDBZnGaIyAx0M0l7OwqRvR8vkO0zohazVtwgYShIUEMVmhS195ApQTNKBnGX3h
 k4BIn+9/YdJetwEC8WMgTgP+i5E+B1S/t4odFaT34wLSPhLrdaEGyyrdzXM8bFjQDdX8
 NG+CXSvHrh2aBzzG+M7s1NeGLneXimSmv0rsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5r+8URYZJJcoMTsx3Jsv0fosCUZBc2qwjE1VPx0QvSI=;
 b=VxTFfcKw/m84J6ZksKUwx1BGw1m/tVbKHYeuYcS8RvPXqZlWxGR3ctX3zIzCCYyyGh
 Ix2JQG0iE1shh0Q6uxNoJxVQJdwsKQ3l0EB9nNsCEYxuUn0otYwTA+fFP+czuUNvFNrl
 wwfZPb2RrDD6UKNgejCXVZYSFdWMMlVtY9M9LePRUo6JAIlbq65zmzLDxDDvC+orWLgD
 0mgxzHcsEZC4lqpNEePYJUfyN288Utb3s49WQGtcVLFo4KIyF44ISGFD3Vh1vhTXd7jt
 jyTWXFvrHPHSefcEqQQ/ayoLPSlyyF/KrWiKt+0pcDVepTzxafCw5S10sg3mRH4PtN1v
 uZEw==
X-Gm-Message-State: AOAM530RFxMmxwMQNPEiB6BtzPWOkqnfEvvV0TeSBzvLq+lQQ6A+TnyZ
 GF4YnI2ZDg3UVJXefKNl1R2x3A==
X-Google-Smtp-Source: ABdhPJwCTowb/UML6s86G4E9Q+bjCRehoPNJnUOxvWtmvHrPf5c9U2WAF8iOa0ieiwUzC4qTod3mkg==
X-Received: by 2002:a37:6196:: with SMTP id v144mr5311912qkb.337.1591827470613; 
 Wed, 10 Jun 2020 15:17:50 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-2c5b-4fc8-1785-177e.inf6.spectrum.com.
 [2606:a000:1401:8080:2c5b:4fc8:1785:177e])
 by smtp.gmail.com with ESMTPSA id b4sm722137qka.133.2020.06.10.15.17.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 15:17:49 -0700 (PDT)
Date: Wed, 10 Jun 2020 18:17:47 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200610221747.GQ24893@bill-the-cat>
References: <20200610185851.GI24893@bill-the-cat>
 <ca74b5b5-3de3-c249-16d5-c5e1de742dc2@denx.de>
 <20200610201148.GJ24893@bill-the-cat>
 <a3f20f91-fecb-81ed-6eb7-5070574f2c64@denx.de>
 <20200610205444.GK24893@bill-the-cat>
 <e9bd8f83-2542-530a-1c47-3ae839f557a6@denx.de>
 <20200610213522.GM24893@bill-the-cat>
 <0b8142d8-2375-ee8f-515d-680f8e93beed@denx.de>
 <20200610215737.GO24893@bill-the-cat>
 <7db25e91-a2ad-26d8-2fb9-f65ea7db0bce@denx.de>
MIME-Version: 1.0
In-Reply-To: <7db25e91-a2ad-26d8-2fb9-f65ea7db0bce@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add Kconfig option to
 select supported configuration
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
Content-Type: multipart/mixed; boundary="===============6786171544832243786=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6786171544832243786==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3m6VNgM56Nljn+Yv"
Content-Disposition: inline


--3m6VNgM56Nljn+Yv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2020 at 12:02:08AM +0200, Marek Vasut wrote:
> On 6/10/20 11:57 PM, Tom Rini wrote:
> [...]
>=20
> >> My point is more in the general direction of being able to configure
> >> SPL/TPL/U-Boot separately, without being forced to craft nasty ifdeffe=
ry
> >> in include/config/board.h if I need something enabled in SPL, but not =
in
> >> U-Boot, and vice versa. And for that the Kconfig should be able to
> >> somehow emit the _SPL/_TPL/U-Boot options of all symbols I think, so
> >> that we won't need separate entry for each.
> >=20
> > I haven't seen a case where the nasty ifdeffery in a config header file
> > wasn't basically either:
> > - Now wrong (we _have_ the symbols today to say we don't want X in SPL)
> > - Working around a case where we need to use $(SPL_TPL_) somewhere but
> >   didn't know that we could use $(SPL_TPL_) to fix the problem instead.
> > - Now not useful (for example, disable CMD_xxx for SPL, but we've really
> >   sorted things out so now so doing that didn't help anything).
> >=20
> > Now I'm happy to admit that I just might be missing a case as I've only
> > gotten as far as "undef CONFIG_[ABC]" and BOOTCOMMAND is possibly
> > leading to embedding a long string where we really don't want it.
> > Please point me at more undef cases that need to be resolved in some
> > way.
>=20
> I don't want to resolve these problems one-by-one , the obvious solution
> for them AND the growth of Kconfig files with multiple copies of the
> same symbol for SPL/TPL/U-Boot is the have Kconfig generate those
> symbols automatically for SPL/TPL/U-Boot and then let user pick the
> configuration as needed. That would make the undefs in
> include/configs/board.h go away easily and would reduce the duplication
> in Kconfig files.

I strongly disagree that having two or three times the number of symbols
to select from will result in a better outcome.  I see 386 SPL_
'^config ' lines (of which a number are 'default y' lines) and that's
more than I thought there would be.  There's also 6175 overall symbols
today.  I would be hopeful that the "lets look at the DTS files and see
what we can tell about a platform" thread could help with configuring a
good binary better.  Because to me the worrisome entries are things like
MMC_HS200_SUPPORT / SPL_MMC_HS200_SUPPORT as I would start by asking if
the cases where we don't enable that in SPL are intention or oversight.

--=20
Tom

--3m6VNgM56Nljn+Yv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7hXAEACgkQFHw5/5Y0
tywalgwAm+EkozIFZA3EEtZhieOvEcsXpORXOHfsqNqJffggRtUqb0OHekrvE7/a
fsydlVzvEPyUp/xrGJynN05ZTVBBrleKLBqqj9iuydlNvaydR0JIZDUEWIVh3PyB
EnGUGyhgXtnY5N+PrsGrFlx41HeLQzSmwXT+7LvOHD+gTeSAGNwXKwO6CTdKgbNb
G5C7mAnmKOc1g52peVAqcHwi7kJOt2xTfi3GlgadHSva7mI4890WVchd45o5nm1v
xqeX3/n1P24kYehGBb/jematT6czUbPhz6vrQrNkLFo+bUT8LLXdQsiXJ6lupdgq
Ge29yJQmOnthsaxd/e4czTwobmk1cd4trENzYIqC5o1sReouF4HSppnsWtoP2Qdp
9y0TA0KZRzRzZsm4mup1MJK0r3g31eStlMNHksRdTtx7Z4YpzB+k5CM7SC8q8UPS
LbziRlS8xoGcxQD7/ILELD76DR4Lptkyocu/jwHeTaQ+10Zu262v79ssNUqUqSod
SoU+Ip3Z
=KKu4
-----END PGP SIGNATURE-----

--3m6VNgM56Nljn+Yv--

--===============6786171544832243786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6786171544832243786==--
