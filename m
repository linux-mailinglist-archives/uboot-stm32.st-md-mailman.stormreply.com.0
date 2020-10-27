Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEE129C150
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Oct 2020 18:25:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50687C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Oct 2020 17:25:40 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66A70C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Oct 2020 17:25:39 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id i7so1579755qti.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Oct 2020 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PWDhR76TuPwIgEiD3/0slJ351ZsYj/er2Ib6QKkByNs=;
 b=bCUzsMT295wztgiM0vRkuWHeCsPoehCALjzkyxHqVD/BrDYwZjmzZJ8431ljc/BtyV
 lNhATCQg+eS6zivV99/ys1vfkdfhyjA8HOT0hMBeKHmvIvhdsqT06srBqu3H3Wxbd2c/
 9MEPMZ8prPxHWbQ1UpZbImwzWtjqhIYfexkBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PWDhR76TuPwIgEiD3/0slJ351ZsYj/er2Ib6QKkByNs=;
 b=aSuxIF2k4c7QxP7gwHG0HConf8MgtAmcJPL+3SW1rB2RGNWmmA0aOBe+SCAVdPUP+h
 k/VLkMxXRaCf5VlJdhyy/d7IZYPtBlqYtTU+LT43UxCE7qS6J5MGoofw+bkWlElNvKHf
 MLogIa2cut5XFfzBI+J4BhNOlH9v4VEEuXbf94GcHazq4rxbkAcF0R2M48Cz9nR+yzd4
 Y+4UMCjLJ/QN44wx87WyM3HH4r1AmDZP4/BEj9oJASdQTrAmq4Zvrz6h8Z9zldozJ6CH
 u1xTwmMJh9fvQReIIqESh2aLptGp9R6IfslgZJOrYfJ8+DrUtXZdyz2QXyrFcW0iu/K2
 o49Q==
X-Gm-Message-State: AOAM530nf/o7Ijh3bQwwm9C44kDwctGR4aiId66oidjBH41c2hb8qdbr
 Fly5Hw+UkK8RYJJoALbCBremnw==
X-Google-Smtp-Source: ABdhPJzBgvwhNv5h7D8crNSgs2WlWj9+yd/ElWukXgyZSRRobA5qQ20KZvR4+KfVSE7eyyn0sqx9uQ==
X-Received: by 2002:ac8:5bc2:: with SMTP id b2mr3206565qtb.284.1603819537386; 
 Tue, 27 Oct 2020 10:25:37 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-f905-bd01-6b83-3c89.inf6.spectrum.com.
 [2606:a000:1401:8ebe:f905:bd01:6b83:3c89])
 by smtp.gmail.com with ESMTPSA id q188sm1136534qka.56.2020.10.27.10.25.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Oct 2020 10:25:36 -0700 (PDT)
Date: Tue, 27 Oct 2020 13:25:33 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20201027172533.GD14816@bill-the-cat>
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <258ba4fa-8d1e-56be-e0de-2d6c09812c13@pengutronix.de>
 <CAMj1kXFoJx7henE0FbSXzsATH4z4Xg8EfJkc+ki7=i33cz3Vew@mail.gmail.com>
 <f629253d8c92446ca1d33a25058c1676@SFHDAG2NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <f629253d8c92446ca1d33a25058c1676@SFHDAG2NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: chenshuo <chenshuo@eswin.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>,
 Stefan Roese <sr@denx.de>, Ard Biesheuvel <ardb@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Simon Glass <sjg@chromium.org>, Tero Kristo <t-kristo@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 0/7] arm: cache: cp15: don't map reserved
 region with no-map property
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
Content-Type: multipart/mixed; boundary="===============2451981318119500020=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2451981318119500020==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kxxrNrcW2VJu0g25"
Content-Disposition: inline


--kxxrNrcW2VJu0g25
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2020 at 05:00:44PM +0000, Patrick DELAUNAY wrote:
> Hi Ard,
>=20
> > From: Ard Biesheuvel <ardb@kernel.org>
> > Sent: mercredi 7 octobre 2020 15:16
> >=20
> > On Wed, 7 Oct 2020 at 13:53, Ahmad Fatoum <a.fatoum@pengutronix.de> wro=
te:
> > >
> > > Hello,
> > >
> > > On 10/7/20 1:23 PM, Ahmad Fatoum wrote:
> > > > My findings[1] back then were that U-Boot did set the eXecute Never
> > > > bit only on OMAP, but not for other platforms.  So I could imagine
> > > > this being the root cause of Patrick's issues as well:
> > >
> > > Rereading my own link, my memory is a little less fuzzy: eXecute Never
> > > was being set, but was without effect due Manager mode being set in t=
he
> > DACR:
> > >
> > > > The ARM Architecture Reference Manual notes[1]:
> > > > > When using the Short-descriptor translation table format, the XN
> > > > > attribute is not checked for domains marked as Manager.
> > > > > Therefore, the system must not include read-sensitive memory in
> > > > > domains marked as Manager, because the XN bit does not prevent
> > > > > speculative fetches from a Manager domain.
> > >
> > > > To avoid speculative access to read-sensitive memory-mapped
> > > > peripherals on ARMv7, we'll need U-Boot to use client domain
> > > > permissions, so the XN bit can function.
> > >
> > > > This issue has come up before and was fixed in de63ac278
> > > > ("ARM: mmu: Set domain permissions to client access") for OMAP2 onl=
y.
> > > > It's equally applicable to all ARMv7-A platforms where caches are
> > > > enabled.
> > > > [1]: B3.7.2 - Execute-never restrictions on instruction fetching
> > >
> > > Hope this helps,
> > > Ahmad
> > >
> >=20
> > It most definitely does, thanks a lot.
> >=20
> > U-boot's mmu_setup() currently sets DACR to manager for all domains, so=
 this is
> > broken for all non-LPAE configurations running on v7 CPUs (except OMAP =
and
> > perhaps others that fixed it individually). This affects all device map=
pings: not just
> > secure DRAM for OP-TEE, but any MMIO register for any peripheral that is
> > mapped into the CPU's address space.
> >=20
> > Patrick, could you please check whether this fixes the issue as well?
> >=20
> > --- a/arch/arm/lib/cache-cp15.c
> > +++ b/arch/arm/lib/cache-cp15.c
> > @@ -202,9 +202,9 @@ static inline void mmu_setup(void)
> >         asm volatile("mcr p15, 0, %0, c2, c0, 0"
> >                      : : "r" (gd->arch.tlb_addr) : "memory");  #endif
> > -       /* Set the access control to all-supervisor */
> > +       /* Set the access control to client (0b01) for each of the 16
> > + domains */
> >         asm volatile("mcr p15, 0, %0, c3, c0, 0"
> > -                    : : "r" (~0));
> > +                    : : "r" (0x55555555));
> >=20
> >         arm_init_domains();
>=20
> The test will take some time to be sure that solve my remaining issue bec=
ause  issue is not always reproductible.
>=20
> At fist chek, I wasn't sure of DACR bahavior, but I found in [1] the line=
 :
>=20
> 	The XN attribute is not checked for domains marked as Manager. Read-sens=
itive memory must
> 	not be included in domains marked as Manager, because the XN bit does no=
t prevent prefetches
> 	in these cases.
>=20
> So, I need  to test your patch +  DCACHE_OFF instead of INVALID=20
> (to map with XN the OP-TEE region) in my patchset.
>=20
> FYI: I found the same DACR configuration is done in:
> 	arch/arm/cpu/armv7/ls102xa/cpu.c:199
>=20
> [1] https://developer.arm.com/documentation/ddi0406/b/System-Level-Archit=
ecture/Virtual-Memory-System-Architecture--VMSA-/Memory-access-control/The-=
Execute-Never--XN--attribute-and-instruction-prefetching?lang=3Den
>=20
> Patrick
>=20
> For information:
>=20
> At the beginning I wasn't sure that the current DACR configuration is an =
issue because in found
> in pseudo code of  DDI0406B_arm_architecture_reference_manual_errata_mark=
up_8_0.pdf
>=20
> B3.13.3 Address translation
> 	if CheckDomain(tlbrecord.domain, mva, tlbrecord.sectionnotpage, iswrite)=
 then
> 		CheckPermission(tlbrecord.perms, mva, tlbrecord.sectionnotpage, iswrite=
, ispriv);
>=20
> B3.13.4 Domain checking
> 	boolean CheckDomain(bits(4) domain, bits(32) mva, boolean sectionnotpage=
, boolean iswrite)
> 		bitpos =3D 2*UInt(domain);
> 		case DACR<bitpos+1:bitpos> of
> 			when =E2=80=9800=E2=80=99 DataAbort(mva, domain, sectionnotpage, iswri=
te, DAbort_Domain);
> 			when =E2=80=9801=E2=80=99 permissioncheck =3D TRUE;
> 			when =E2=80=9810=E2=80=99 UNPREDICTABLE;
> 			when =E2=80=9811=E2=80=99 permissioncheck =3D FALSE;
> 		return permissioncheck;
>=20
> B2.4.8 Access permission checking
> 	// CheckPermission()
> 	// =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	CheckPermission(Permissions perms, bits(32) mva,
> 		boolean sectionnotpage, bits(4) domain, boolean iswrite, boolean ispriv)
>=20
> 		if SCTLR.AFE =3D=3D =E2=80=980=E2=80=99 then
> 			perms.ap<0> =3D =E2=80=981=E2=80=99;
> 			case perms.ap of
> 				when =E2=80=98000=E2=80=99 abort =3D TRUE;
> 				when =E2=80=98001=E2=80=99 abort =3D !ispriv;
> 				when =E2=80=98010=E2=80=99 abort =3D !ispriv && iswrite;
> 				when =E2=80=98011=E2=80=99 abort =3D FALSE;
> 				when =E2=80=98100=E2=80=99 UNPREDICTABLE;
> 				when =E2=80=98101=E2=80=99 abort =3D !ispriv || iswrite;
> 				when =E2=80=98110=E2=80=99 abort =3D iswrite;
> 				when =E2=80=98111=E2=80=99
> 			if MemorySystemArchitecture() =3D=3D MemArch_VMSA then
> 				abort =3D iswrite
> 			else
> 				UNPREDICTABLE;
> 			if abort then
> 				DataAbort(mva, domain, sectionnotpage, iswrite, DAbort_Permission);
> 			return;
>=20
> =3D> it seens only the read/write permission is checked here (perms.ap)
> =3D> perms.xn is not used here
>=20
> 	access_control =3D DRACR[r];
> 	perms.ap =3D access_control<10:8>;
> 	perms.xn =3D access_control<12>;
>=20
> with AP[2:0], bits [10:8]
> 	Access Permissions field. Indicates the read and write access permission=
s for unprivileged
> 	and privileged accesses to the memory region.
>=20
> But now it is clear with [1]

So, where did everything end up here?  I specifically didn't grab this
series as it sounded like there was concern the problem should be solved
via another patch.  Or would that be an in-addition-to?  Thanks!

--=20
Tom

--kxxrNrcW2VJu0g25
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+YWA0ACgkQFHw5/5Y0
tyyTQQv/cfq1J3/vctHTuuqNPha1jxyDgYE/EQPDkEV5pJP6uPIr6wtwvG1v5TBH
HTzl0YSbXhvgQ1vj4ew5A+lSGyTD1+M4FcBGKSLc1iVPI4ZEhezktn4PZ3Y50vIt
V0b1tGakOhIvhCbiAupGuv6/w5alXpAwDXQZsM0jHqR4+9nhSlumSUg8mq6CCP7f
6iraVdY4Nerv24Fg4NFjJEDweJ0VMJFf5lnqpqFzaW7Jc5IiBOa5npxw4Gm2RPWG
AV+NoXg9q8kKDZTjRrc9inJLpol7/XoHnLo2YW1Rx/A0znKOhhpnwAuEKO48Jvqp
Z6qfBIqut/PznQI4HzaGECt/anadXsk4AbdyGCOHzq0sE3DhD8fIISWQ0JsNz88f
3KeTd1vrAZJfxn3CNljUzSQcyLlAPbZu6JA/gFOliSv6/EO/M1bffgR5saEdyQWx
gu3fr8Xume6kzIwa1WnJhFgQcwbg5sBL2Gt5vu5x8gMbrnmEvmsVA9pJesJiwORy
lsoZsjl0
=7ZTV
-----END PGP SIGNATURE-----

--kxxrNrcW2VJu0g25--

--===============2451981318119500020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2451981318119500020==--
