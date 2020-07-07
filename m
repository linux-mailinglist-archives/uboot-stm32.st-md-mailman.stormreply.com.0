Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B14217896
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 22:09:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00FC5C36B29
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 20:09:06 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3833C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 20:09:04 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id q198so39389695qka.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 13:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SwvLCD0PJ3ncEBZHDAGGYUse19UngU/KM15bsrypLsc=;
 b=lc6Z1yUvWvmFAIh5y1NjUzDl8uh8YWg9B2YpfBgE4z3/mb/Dh86q8frboRQZROUQQt
 pbF5F0HXZ/wdoM/DonCJSSA6ZsqZsvs4qyk65PfOFGcYS4Ge7qtnOjaeBzOnGOMgdGIF
 y3lCpehrgnMOwX4kgcOAnaV+M8Rp+GmeM+9UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SwvLCD0PJ3ncEBZHDAGGYUse19UngU/KM15bsrypLsc=;
 b=kTbaPxWFtT4XNjG4ylMPnReb26t0Fb3Jc1cFQarXvBbnqST9N8MkLrJyBLJ46Eld9T
 OmrYNg5dDjslunQokxYnc854PWfv2O67/JQZTH0rjyFxE4v3b7FiQuRQpEDe5b5fAueI
 tGdxvVBwZTTOKF1/0l79aONxYQrANX2SQRadpuPMbn50/zYSvHJBUtt0jf3LCIqeUbPw
 HC5kClhYsmExvTZd1D+Sh6tRZsm9STIe6W7ieIdr5WVByZ8pYlorbBQUFd8+cHBPd8vx
 LiOSRe9+jKNqvm0XW50jaNdYnzwujetnnNhig26/jmzPeFHl2AzWSjFFFMfmoWbxyLJu
 KhXA==
X-Gm-Message-State: AOAM530fNMDkihcfSkDG6ZUtqwz12bBWkeEHdm0QkMqY2MJEyhhLQOd3
 5xvTscsMz2OzJ+4YqD8qENeI5w==
X-Google-Smtp-Source: ABdhPJwW9iFMTjwqzIED8MifGw1x5wBI9pA8xzZFbMr9gt+N5hQqbC0QvCRbfgZT+NJmMkR8dJQPFA==
X-Received: by 2002:ae9:f814:: with SMTP id x20mr53535035qkh.253.1594152542965; 
 Tue, 07 Jul 2020 13:09:02 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-dd52-ab8a-1bf1-56f7.inf6.spectrum.com.
 [2606:a000:1401:8080:dd52:ab8a:1bf1:56f7])
 by smtp.gmail.com with ESMTPSA id p80sm24479266qke.19.2020.07.07.13.09.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jul 2020 13:09:01 -0700 (PDT)
Date: Tue, 7 Jul 2020 16:08:59 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20200707200859.GA10034@bill-the-cat>
References: <20200430100619.28557-1-patrice.chotard@st.com>
 <20200430100619.28557-2-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20200430100619.28557-2-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/5] cmd: bind: allow to bind driver
	with driver data
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
Content-Type: multipart/mixed; boundary="===============2676560301617326701=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2676560301617326701==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 12:06:15PM +0200, Patrice Chotard wrote:

> Initial implementation invokes device_bind_with_driver_data()
> with driver_data parameter equal to 0.
> For driver with driver data, the bind command can't bind
> correctly this driver or even worse causes data abort as shown below:
>=20
> As example, for debug purpose on STM32MP1 platform, ethernet (dwc_eth_qos=
=2Ec)
> driver needed to be unbinded/binded. This driver is using driver data:
>=20
> static const struct udevice_id eqos_ids[] =3D {
>     {
>         .compatible =3D "nvidia,tegra186-eqos",
>         .data =3D (ulong)&eqos_tegra186_config
>     },
>     {
>         .compatible =3D "snps,dwmac-4.20a",
>         .data =3D (ulong)&eqos_stm32_config
>     },
>=20
>     { }
> };
>=20
> After unbinding/binding this driver and probing it (with the dhcp command=
),
> we got a prefetch abort as below:
>=20
> STM32MP> unbind eth ethernet@5800a000
> STM32MP> bind /soc/ethernet@5800a000 eth_eqos
> STM32MP> dhcp
> prefetch abort
> pc : [<4310801c>]          lr : [<ffc8f4ad>]
> reloc pc : [<035ba01c>]    lr : [<c01414ad>]
> sp : fdaf19b0  ip : ffcea83c     fp : 00000001
> r10: ffcfd4a0  r9 : fdaffed0     r8 : 00000000
> r7 : ffcff304  r6 : fdc63220     r5 : 00000000  r4 : fdc5b108
> r3 : 43108020  r2 : 00003d39     r1 : ffcea544  r0 : fdc63220
> Flags: nZCv  IRQs off  FIQs off  Mode SVC_32
> Code: data abort
> pc : [<ffc4f9c0>]          lr : [<ffc4f9ad>]
> reloc pc : [<c01019c0>]    lr : [<c01019ad>]
> sp : fdaf18b8  ip : 00000000     fp : 00000001
> r10: ffcd69b2  r9 : fdaffed0     r8 : ffcd69aa
> r7 : 00000000  r6 : 00000008     r5 : 4310801c  r4 : fffffffc
> r3 : 00000001  r2 : 00000028     r1 : 00000000  r0 : 00000006
> Flags: NzCv  IRQs on  FIQs on  Mode SVC_32 (T)
> Code: 2f00 d1e9 2c00 dce9 (f855) 2024
> Resetting CPU ...
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Sorry for the delay in getting to this.  Currently, this breaks the dm
unit tests on sandbox, can you please investigate?  Thanks!

--=20
Tom

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8E1lEACgkQFHw5/5Y0
tyzKXwv/XuP+XZj22Qka+LeSX4AWdTnwceWbyhPOL91Yao1Qiw1tQfagTKbHwVFl
A4/8Fyb//ELKB+yaD7h/b5si6GlVpZq67hT1NvC9QWG7014TVb2bP8+bE6Ze0eWz
zov0TvgGGaFGRemsCro10gnGDBOK71MECpW6FHmiNRcm5wLbmB0LaYISHCb7pNl0
03louQYgan1R+0PyITrs/jA/QaNyV6hJ2qJEgzhivthDviJ1dcxvlZ6Gx4ZhehYy
5fklzlrVeFAsuzCZuSsDKUcJ1xjTi+vwhKSSPYyZDnm2/8oSo2igmkgLdt+tlPBj
QO3Kw5n7b4jtl/AD4p22rKB3DcLsn4MfX+CTrpu4B2XiILNuW19Wy3aRPe0ado9F
FOuCpGMZFthuoWMnXkYuQhoIFNJJZj+zk5Iy66svHWBzCswnHnezCw41DRqDKKis
NEBvGLMyBA3hxNp1gWrpSCIJARlgn9Zfj0o33bqmHCuQdckHmHR6URFSnAj5jJ9q
nqPDpnl4
=h1pk
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--

--===============2676560301617326701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2676560301617326701==--
