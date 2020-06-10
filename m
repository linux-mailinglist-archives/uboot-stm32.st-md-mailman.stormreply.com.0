Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE91F5D6A
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 22:54:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 235F4C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 20:54:50 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C002C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 20:54:48 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id n141so3547647qke.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 13:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IylXidLm8nX1Q9tYmvRVF5YISzDSePTvHOd1PyRjjVg=;
 b=CPlpAkU8G8pj1VBRPHc+/UozD21z7hj/xUDbLXP/ASLGlrU9Haqa5hIC8/aAnSMsGL
 9XTmHDvAt/+jKanRjGYOApkT5es3Qg3bSHL0/GZ4lAmFb5ewMHCEYCLY2dPgDCK8fajU
 D8lj3RKlGZGQvVbpp11C5re9vcrmC5VFS2sB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IylXidLm8nX1Q9tYmvRVF5YISzDSePTvHOd1PyRjjVg=;
 b=XSph1Y8Tss0CpOfcPwqk8JMPEuT8L/tQoCOkvyo053A0yF1sUkytFwVbiNXcKfijSD
 9CKBvAd1saAF2NkI3/Xhi0B6xbFJ3RPNIx/YpDtL8CkNgieFAJsj49O75OF8/qRjuni0
 5qdOT6lbIIhxK3G3L5sAKwwvHkKnUMZpKYj7S+lExrLeKICrrwsaTJl++m5tYJfBMgH3
 DvtFNcCJJJa4FP9h2oudEjzcWIPAz3ItvnfhF5s3TWEYE+sUIqOU7TaOxMXkPZm7o271
 +orAznCJ0ma+MSUTUcbUIkQNUU6xfhMP9qnArZyEbbDZdHoDIP8Ldlswkgq5jwDBfiM8
 stIA==
X-Gm-Message-State: AOAM531wYsIODRO3Un1nne3dwlgCYuQd2j0vaeNLQxOV00kKPviPkAOV
 QtBkpSIWEDWFy3EIlbrmUplo3A==
X-Google-Smtp-Source: ABdhPJyDjH2NWKc0XHedDDBLK5erRxVtfYPgN3hCtluvPSWtaFPlaHfg6bCtVqOZelOp7VVMoqH3YQ==
X-Received: by 2002:ae9:efc2:: with SMTP id d185mr5119523qkg.177.1591822487265; 
 Wed, 10 Jun 2020 13:54:47 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-2c5b-4fc8-1785-177e.inf6.spectrum.com.
 [2606:a000:1401:8080:2c5b:4fc8:1785:177e])
 by smtp.gmail.com with ESMTPSA id g9sm760658qtq.66.2020.06.10.13.54.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 13:54:46 -0700 (PDT)
Date: Wed, 10 Jun 2020 16:54:44 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200610205444.GK24893@bill-the-cat>
References: <20200608092719.10643-1-patrick.delaunay@st.com>
 <20200610181019.GE24893@bill-the-cat>
 <9f331ffe-b156-8add-e098-69908b80cebf@denx.de>
 <20200610185218.GH24893@bill-the-cat>
 <552c2b40-7aaf-c015-ca49-ef14ae6ac905@denx.de>
 <20200610185851.GI24893@bill-the-cat>
 <ca74b5b5-3de3-c249-16d5-c5e1de742dc2@denx.de>
 <20200610201148.GJ24893@bill-the-cat>
 <a3f20f91-fecb-81ed-6eb7-5070574f2c64@denx.de>
MIME-Version: 1.0
In-Reply-To: <a3f20f91-fecb-81ed-6eb7-5070574f2c64@denx.de>
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
Content-Type: multipart/mixed; boundary="===============3507626342859911653=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3507626342859911653==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GN/IAAAoV4GJoJGS"
Content-Disposition: inline


--GN/IAAAoV4GJoJGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 10:46:23PM +0200, Marek Vasut wrote:
> On 6/10/20 10:11 PM, Tom Rini wrote:
> [...]
> >>>>> You mean be more like barebox and Linux where the board-specific st=
uff
> >>>>> is kicked up one level and we have a more generic binary?  I don't =
know
> >>>>> and there's so much work that would be required before having to mo=
ve
> >>>>> this from a Kconfig choice to just Kconfig options I don't see that=
 as
> >>>>> being a relevant question here.
> >>>>>
> >>>>> Or did I misunderstand the question?
> >>>>
> >>>> More like automatically have a Kconfig option generate it's _SPL and
> >>>> _TPL variant.
> >>>
> >>> Ah.  Well, that is rephrasing my first question.  Would it ever make
> >>> sense to have more than one of these enabled?
> >>
> >> For some sort of universal SPL, maybe ?
> >=20
> > So no, there's not a reason today then and it should be a choice.
>=20
> Can you provide some more detailed explanation why we shouldn't generate
> _SPL and _TPL variants of Kconfig entries for all Kconfig entries ? It
> would make things much simpler and permit configuring SPL/TPL the same
> way U-Boot is configured, with their own set of options.

In the context of this particular thread?  I don't see how it's helpful
to say 3 times that we're in fact building for Tegra or STM32 or SoCFPGA
when you can't build something that runs on more than one of those.

--=20
Tom

--GN/IAAAoV4GJoJGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7hSJEACgkQFHw5/5Y0
tyxN/gv+IdN9EBR/RE53MjExTx7c34NK7CnCvdTHkBoNYrDtEMdNu2tSsaoshmEX
hMnl2l89FtQzhIF3RVytnIv24wUdGxI4rtEaLrU5XCQqV1K5znbliHjwZug/Mh60
idwfhCeqLWBw4In1rSruzXeda4QAubnDcEgVWgJ3Q5xCmYg/Xm/VU2SMwtLHPvsH
oPKPDxb8PDtpUA117T1lMspIpsvY7/GEx4oxycY223dG2SJdi0dMeLrsWpE4SHdT
eHbIbWaGzQD90mBReinSUoMfHvUX+wDG8EC7rOe0sdZE5b0su3SEVxIkvRCw5Hub
Z3cObsfhEY2LpRK62dXzoM5M+Ypk0J7gs1CD7OVC2gW1i7FXSQ15uEmsDfU2ITWh
+GfbMdg5E1CH26PNREB2/n5UeovCR2BnBp2hprKgCfHa87XJSZGtx0kiLnYukxU/
/kB1lpcsthmxFPdtZBOD388Jhh2yM70GhpzkRUMCxYDg8JnrxDxoUpP3qOt+qULi
wv2rITV0
=hj2K
-----END PGP SIGNATURE-----

--GN/IAAAoV4GJoJGS--

--===============3507626342859911653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3507626342859911653==--
