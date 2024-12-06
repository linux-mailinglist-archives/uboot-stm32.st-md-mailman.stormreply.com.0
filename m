Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 094409E7648
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2024 17:39:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC01FC6DD9D;
	Fri,  6 Dec 2024 16:39:43 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D00F1C6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 16:39:36 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-46695dd02e8so22713791cf.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2024 08:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1733503176; x=1734107976;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6XwsIsYx+lCjIGoZ9wo3ImEreZ1W5Nu1OSK4u1mpYsQ=;
 b=C4FdO7dM3BqrnWVVA2iyQgTpz0PAZ6iwD+WOBH5V9nIf9vFP88LST8UQ5rRXhSlQh9
 IxWyvzkPzSNpN4NcrOL1lUof1TZNiizz8rdOs895xOuJ8/+15AZEhq16/VASg6Xx/0Hi
 4EFPYamFFKZwH+zNBfs6F4cETXqcWnek2kA4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733503176; x=1734107976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6XwsIsYx+lCjIGoZ9wo3ImEreZ1W5Nu1OSK4u1mpYsQ=;
 b=DD01M8rX0LgmI3AwoO2Y4y5QqczmG6TH5DxcAa+cJcpnbROo79w20zM0EahJ2Jd1oF
 gKrhErYRHWJOwPeMyJRiTQAQPvln4RIod8yluw+c2+f6o+iW3LyhdIU5PBMR9uVstyKr
 5/RNU/8xW5C+GCcOVKZTppVEZj47s3l1zfrDwZCprZcAuvqL9wxLy26jmvap5WAZ+bcv
 u60GC+bkE8QBG5dRwmVKkll9OpPZUhTsY0kFw0LhhG0vsRGPfT65VfB1BKRTykvZYooj
 hXc7BbImLOkULJAOQBPx5sKjyOsN/4C9TypdcguUHnpk0mq7VJSOYH2jl4ku5X3gTm+T
 HuzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxuW+eOVhLRYa70GSLiJIwut/cwNC1pH5f8kPOM6YuL0HbgjGfyDi1kIF6MW6fvOopMqJefgE4QDxHMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw6h27zvBIeSqu2fmhW1y+N1uNAneWEFLHAaFrMw4nQ6ZJDkQA8
 dQ1F11p21u/ZqlKXBwFMSPqxEvzRqv2Ool57mAVaZwU8g4H535dqM3wnWcK5I34=
X-Gm-Gg: ASbGncuMZDWlhPOc3lp47kGvuAtXiImNp1F3TEEVDNr//u3uU+mS3drepwnRGlABW8W
 Ha1+wS7C/ZAQKSTJt9xoLWgKXtaSTp8XDyniMsebDh3fEPfUfYLjlBi8m4JOQropycfG34TxpbE
 lFK2TRZztH/sQ6Z9r/lX5KHBokCVA05jRAKI9kjuOjP5fkCqoE2cdqp7cTN66T2LVJC9oEzslev
 +G9Td7Mudkg19v3jh9aSq8SBXgrjnTf+rSzxeeODXOa5ONmXg==
X-Google-Smtp-Source: AGHT+IERZi2SuY8EZV8fx6YRiqhe0xejjoXya9lXzqKgM64Tb2QeMK/E3xSazs/g9I9YdIfx/jx1aA==
X-Received: by 2002:ac8:59d5:0:b0:466:aa1b:1cfd with SMTP id
 d75a77b69052e-46734cb539bmr61486161cf.15.1733503175660; 
 Fri, 06 Dec 2024 08:39:35 -0800 (PST)
Received: from bill-the-cat ([187.144.30.219])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-467296ca681sm22555851cf.24.2024.12.06.08.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 08:39:34 -0800 (PST)
Date: Fri, 6 Dec 2024 10:39:31 -0600
From: Tom Rini <trini@konsulko.com>
To: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>
Message-ID: <20241206163931.GS2457179@bill-the-cat>
References: <edcec18f-75a0-44d8-907a-f042779ca6ee@mailbox.org>
 <86ses458k3.fsf@udb0321960.dhcp.ti.com>
 <f7bb335d-681a-4b60-92f6-b605cc6f477f@mailbox.org>
 <86pln759j9.fsf@udb0321960.dhcp.ti.com>
 <33e99705-77e3-4acf-95f7-fad65f60ae62@mailbox.org>
 <86ldxp6ehf.fsf@udb0321960.dhcp.ti.com>
 <865xny69y1.fsf@udb0321960.dhcp.ti.com>
 <SA1PR12MB86974AC7EFCCBD7AE99FDD3E98302@SA1PR12MB8697.namprd12.prod.outlook.com>
 <8634j15t1y.fsf@udb0321960.dhcp.ti.com>
 <SA1PR12MB869743652A0B3EC3335A9F9F98312@SA1PR12MB8697.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SA1PR12MB869743652A0B3EC3335A9F9F98312@SA1PR12MB8697.namprd12.prod.outlook.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Jon Humphreys <j-humphreys@ti.com>, Michael Walle <mwalle@kernel.org>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, "Simek, Michal" <michal.simek@amd.com>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
 memories support in QSPI driver"
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
Content-Type: multipart/mixed; boundary="===============5032326745957009726=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5032326745957009726==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="alfT6XMccdNcK5wJ"
Content-Disposition: inline


--alfT6XMccdNcK5wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 09:46:08AM +0000, Abbarapu, Venkatesh wrote:
>=20
>=20
> > -----Original Message-----
> > From: Jon Humphreys <j-humphreys@ti.com>
> > Sent: Friday, December 6, 2024 10:04 AM
> > To: Abbarapu, Venkatesh <venkatesh.abbarapu@amd.com>; Marek Vasut
> > <marek.vasut@mailbox.org>; Simek, Michal <michal.simek@amd.com>; u-
> > boot@lists.denx.de; Tom Rini <trini@konsulko.com>
> > Cc: Andre Przywara <andre.przywara@arm.com>; Ashok Reddy Soma
> > <ashok.reddy.soma@amd.com>; Jagan Teki <jagan@amarulasolutions.com>;
> > Michael Walle <mwalle@kernel.org>; Patrice Chotard
> > <patrice.chotard@foss.st.com>; Patrick Delaunay <patrick.delaunay@foss.=
st.com>;
> > Pratyush Yadav <p.yadav@ti.com>; Quentin Schulz <quentin.schulz@cherry.=
de>;
> > Sean Anderson <seanga2@gmail.com>; Simon Glass <sjg@chromium.org>;
> > Takahiro Kuwano <Takahiro.Kuwano@infineon.com>; Tudor Ambarus
> > <tudor.ambarus@linaro.org>; uboot-stm32@st-md-mailman.stormreply.com
> > Subject: RE: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories =
support in
> > QSPI driver"
> >=20
> > "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com> writes:
> >=20
> > > Hi,
> > >
> > >> -----Original Message-----
> > >> From: Jon Humphreys <j-humphreys@ti.com>
> > >> Sent: Thursday, December 5, 2024 9:47 AM
> > >> To: Marek Vasut <marek.vasut@mailbox.org>; Simek, Michal
> > >> <michal.simek@amd.com>; u-boot@lists.denx.de; Tom Rini
> > >> <trini@konsulko.com>
> > >> Cc: Andre Przywara <andre.przywara@arm.com>; Ashok Reddy Soma
> > >> <ashok.reddy.soma@amd.com>; Jagan Teki <jagan@amarulasolutions.com>;
> > >> Michael Walle <mwalle@kernel.org>; Patrice Chotard
> > >> <patrice.chotard@foss.st.com>; Patrick Delaunay
> > >> <patrick.delaunay@foss.st.com>; Pratyush Yadav <p.yadav@ti.com>;
> > >> Quentin Schulz <quentin.schulz@cherry.de>; Sean Anderson
> > >> <seanga2@gmail.com>; Simon Glass <sjg@chromium.org>; Takahiro Kuwano
> > >> <Takahiro.Kuwano@infineon.com>; Tudor Ambarus
> > >> <tudor.ambarus@linaro.org>; Abbarapu, Venkatesh
> > >> <venkatesh.abbarapu@amd.com>;
> > >> uboot-stm32@st-md-mailman.stormreply.com
> > >> Subject: Re: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
> > >> memories support in QSPI driver"
> > >>
> > >> Jon Humphreys <j-humphreys@ti.com> writes:
> > >>
> > >> > Marek Vasut <marek.vasut@mailbox.org> writes:
> > >> >
> > >> >> On 11/7/24 4:49 PM, Jon Humphreys wrote:
> > >> >>> Marek Vasut <marek.vasut@mailbox.org> writes:
> > >> >>>
> > >> >>>> On 11/6/24 10:58 PM, Jon Humphreys wrote:
> > >> >>>>> Marek Vasut <marek.vasut@mailbox.org> writes:
> > >> >>>>>
> > >> >>>>>> On 11/6/24 8:18 PM, Jon Humphreys wrote:
> > >> >>>>>>> Marek Vasut <marek.vasut@mailbox.org> writes:
> > >> >>>>>>>
> > >> >>>>>>>> On 10/23/24 10:17 AM, Michal Simek wrote:
> > >> >>>>>>>>>
> > >> >>>>>>>>>
> > >> >>>>>>>>> On 10/22/24 23:06, Marek Vasut wrote:
> > >> >>>>>>>>>> This reverts commit
> > 1e36d34b52e7a1ebe5a2a5339d6905540f4253aa.
> > >> >>>>>>>>>>
> > >> >>>>>>>>>> This parallel/stacked support breaks basic SPI NOR
> > >> >>>>>>>>>> support, e.g. this no longer works:
> > >> >>>>>>>>>>
> > >> >>>>>>>>>> =3D> sf probe && sf update 0x50000000 0 0x160000
> > >> >>>>>>>>>> SF: Detected s25fs512s with page size 256 Bytes, erase
> > >> >>>>>>>>>> size
> > >> >>>>>>>>>> 256 KiB, total 64 MiB device 0 offset 0x0, size 0x160000
> > >> >>>>>>>>>> SPI flash failed in read step
> > >> >>>>>>>>>
> > >> >>>>>>>>> Reverting everything seems to me too much. Tom has tested
> > >> >>>>>>>>> it on his HW and didn't see any issue. That's why better to
> > >> >>>>>>>>> look at code which is causing this.
> > >> >>>>>>>>> You are reverting everything but likely there is specific
> > >> >>>>>>>>> patch which is causing this. Which one is it?
> > >> >>>>>>>>> Which board was used for your testing? Likely we don't have
> > >> >>>>>>>>> access to
> > >> it.
> > >> >>>>>>>>> Is there any QEMU available which can be used for debuggin=
g?
> > >> >>>>>>>>
> > >> >>>>>>>> The testcase including the exact SPI NOR model is above.
> > >> >>>>>>>>
> > >> >>>>>>>> iMX6 with w25q16dw seems to be broken too.
> > >> >>>>>>>>
> > >> >>>>>>>> Basically every board I have access no longer has a working
> > >> >>>>>>>> "sf probe ; sf update" combination ... so yeah, this means
> > >> >>>>>>>> this patchset is fundamentally broken.
> > >> >>>>>>>>
> > >> >>>>>>>
> > >> >>>>>>> I can also confirm that the patch series:
> > >> >>>>>>>
> > >> >>>>>>> f8efc68b30e Merge patch series "spi-nor: Add parallel and
> > >> >>>>>>> stacked memories support"
> > >> >>>>>>>
> > >> >>>>>>> breaks SPI NOR on TI platforms, particularly SK-AM62 and SK-
> > AM62P:
> > >> >>>>>>>
> > >> >>>>>>> U-Boot 2024.10-00752-gf8efc68b30e2 (Nov 06 2024 - 12:25:13
> > >> >>>>>>> -0600)
> > >> >>>>>>>
> > >> >>>>>>> SoC:   AM62X SR1.0 HS-FS
> > >> >>>>>>> Model: Texas Instruments AM625 SK ...
> > >> >>>>>>> Hit any key to stop autoboot:  0 =3D> sf probe && sf update
> > >> >>>>>>> ${loadaddr} 0x400000 0x10
> > >> >>>>>>> SF: Detected s28hs512t with page size 256 Bytes, erase size
> > >> >>>>>>> 256 KiB, total 64 MiB device 0 offset 0x400000, size 0x10 SPI
> > >> >>>>>>> flash failed in read step =3D>
> > >> >>>>>> Sigh ... can you please test current u-boot/master and see if
> > >> >>>>>> the error is fixed there ?
> > >> >>>>>>
> > >> >>>>>
> > >> >>>>> Yes I had verified it also fails against master, although the
> > >> >>>>> behavior was a bit different.  The .'s below are our DMA engine
> > >> >>>>> waiting
> > >> indefinitely.
> > >> >>>>>
> > >> >>>>> =3D> sf probe && sf update ${loadaddr} 0x400000 0x10
> > >> >>>>> SF: Detected s28hs512t with page size 256 Bytes, erase size 256
> > >> >>>>> KiB, total 64 MiB device 0 offset 0x400000, size 0x10
> > >> >>>>> .....................................................
> > >> >>>>>
> > >> >>>>> I have not investigated further.
> > >> >>>>
> > >> >>>> Can you try and run some 'git bisect' to find out exactly which
> > >> >>>> commit broke your use case ? There is a bunch of fixes for the
> > >> >>>> worst breakage that landed recently, but clearly there is more.
> > >> >>>>
> > >> >>>> Full revert seems increasingly appealing ...
> > >> >>>
> > >> >>> commit 5d40b3d384d
> > >> >> So there is still something broken in that specific commit that I
> > >> >> missed when removing the defects ? Sigh ... can you try to narrow=
 it down ?
> > >> >
> > >> > Hi Marek, I tried to narrow the changes in commit
> > >> > 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 a bit by first applying
> > >> > all of the changes in the .h files, and then for spi-nor-core.c,
> > >> > only applying changes per function. The only function change that
> > >> > causes errors was spi_nor_read(). With the changes in
> > >> > spi_nor_read() in commit
> > >> > 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 applied to the prior
> > >> > commit fbe16bc2801, did I get:
> > >> >
> > >> > =3D> sf probe && sf update ${loadaddr} 0x400000 0x10
> > >> > SF: Detected s28hs512t with page size 256 Bytes, erase size 256
> > >> > KiB, total 64 MiB device 0 offset 0x400000, size 0x10 SPI flash
> > >> > failed in read step
> > >> >
> > >>
> > >> Hi all.  What is the status of addressing the failures introduced by
> > >> this patchset?  I tried building from u-boot next and still see the =
failure.
> > >>
> > >> Marek, was the isolation of changes I performed above helpful in
> > >> understanding the failure?
> > >>
> > >
> > > Can you try by applying this change
> > > https://lore.kernel.org/u-boot/20241118090544.21956-1-venkatesh.abbara
> > > pu@amd.com/
> > >
> >=20
> > Hi Venkatesh, the patch seems to remove the issue I was seeing.
> >=20
> > Thanks
> > Jon
>=20
> Hi Humphreys,
> Thank you for confirming that the patch worked and resolved the issue.

OK, but going back to the patch in question, Tudor has requested
changes. When can we expect a v2 that addresses those, so that Jon and
Marek can also confirm their platforms work? Thanks.

--=20
Tom

--alfT6XMccdNcK5wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmdTKL8ACgkQFHw5/5Y0
tyy9Jwv+PcWpv69r+9w3rNbBnJBc/qlRHyvg6CHPr474Xl8V64V2WttFIBXfG+MP
Nej6iAla3lA/ihp2ZuS9dAuXyY600sWGXKUEqrQpzKALse6knwvQjR5JBmR13J9A
1yY385ajXfnYu28HsuPYGsckdLRdKpdpIlaQQqxK+B2wEAYvMtazcnmcFEbxCPAS
3srlhtB4o8tO9yvGGo+6invXd4E9/gExDfWWT4d3r8KqIWys9+IRSZzXl35N2kg/
5qMwPtpAmPdYO7kvbFyhXvnk3MibsLPTAN6IVWs46RJ4sj1AVet/ufOoRLb96uQE
kUTA5e7tUPJSpVCX2qKFwrwsowtrSH3XaLX3WZbeBcuwH+DJIM13WVnDIBY2mae7
JQ6EzuK/ai79MDjCrp3LRvLBewAwDJrdtc/mUn3aDb6ehcNPpP/vC5sIHNMFvDBo
0TDHHl0rkuM30B1sQ+H53DCRQZLZ9MyHRA/ZNcWpmwUPBZKEFp84onRxqnar+nML
MRA1OwvO
=5V6T
-----END PGP SIGNATURE-----

--alfT6XMccdNcK5wJ--

--===============5032326745957009726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5032326745957009726==--
