Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 457501B30A6
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 21:50:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03028C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 19:50:24 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4DB1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 19:50:20 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id i68so6937755qtb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 12:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=12CWYOROkct4VuIkuFnAD3JmCRh/lgpoQ4vZjKx4Ayw=;
 b=rdjwplam29QxYSSo2L1iwiNhwZYmoVL/8XdcvVFeQXpMgXQ9w6TazoMLkdnrWruQNh
 sHrWgzbdZl9HD2ftQg0nPizpwYXbTG6dZuRC3esXiMQRRMQNi292es18avGr2r49UxNE
 4T9N9qZQ5oiEAHxZ8SlUbYDM1VJEcN1rbKgC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=12CWYOROkct4VuIkuFnAD3JmCRh/lgpoQ4vZjKx4Ayw=;
 b=XdqeY85XPUlEql55+JEHFzxv0ySxUQbFiaPRAQ3eGg62ql+xsRCOaQnf1uArlunOVr
 X+m8kUHrSjcNDlig64VCkMH+Og2bmr53RzWzZ0KhLD21yFJnbCmJ/oiREOTWfaafIo+V
 uxe/Qk0uatmzmgABrP9kDsuiDogK1dVrJwMsH8jZVsaTpeKqTfq4x9+Syv2aSNtg09pU
 MmHz/DfKMUW20CsPkEEMQnySlcD3lKYDhyfAztrqSxkvmQwYyt5xdylsv6lLaEAE7WqW
 3Z7YkNHFPfRj9ZDqBAJzORmHHymyPTJCKPyUcLUa+1t45iU7Or2kzek8xJeZIS+gzakb
 21RA==
X-Gm-Message-State: AGi0PuY/BMBfgS+CZLLca89xzQZsChC9BO1LO2hut3Mdrvva+nM2QwjL
 pi8h6oOhv+5aDuoQOx2+42CCYQ==
X-Google-Smtp-Source: APiQypLZTP586k9/qCU/VDVh0aZhTcQSV2V8txvsQc2AB+4UoAnkAK8byXVoWjmud4cMrD9jm2aLGQ==
X-Received: by 2002:ac8:724b:: with SMTP id l11mr9403580qtp.35.1587498619177; 
 Tue, 21 Apr 2020 12:50:19 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-c4a8-1219-60f0-e12c.inf6.spectrum.com.
 [2606:a000:1401:826f:c4a8:1219:60f0:e12c])
 by smtp.gmail.com with ESMTPSA id a27sm2467110qtb.26.2020.04.21.12.50.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Apr 2020 12:50:18 -0700 (PDT)
Date: Tue, 21 Apr 2020 15:50:15 -0400
From: Tom Rini <trini@konsulko.com>
To: Peng Fan <peng.fan@nxp.com>
Message-ID: <20200421195015.GP4555@bill-the-cat>
References: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
 <d73f5820-92a8-b182-fca3-f8ca2fe49a01@st.com>
 <DB6PR0402MB2760B504CC3F094DA95AC8E088D50@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760B504CC3F094DA95AC8E088D50@DB6PR0402MB2760.eurprd04.prod.outlook.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
 mmc_get_env_dev with OF_CONTROL
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
Content-Type: multipart/mixed; boundary="===============5029206463245052024=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5029206463245052024==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GyBFFrpYHGV4SYp0"
Content-Disposition: inline


--GyBFFrpYHGV4SYp0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 10:35:40AM +0000, Peng Fan wrote:
> > Subject: Re: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
> > mmc_get_env_dev with OF_CONTROL
> >=20
> > Hi Tom
> >=20
> > I just noticed that this env series is delegated to Peng Fan (mmc maint=
ainer)
> > instead of Joe Hershberger (env maintainer).
> >=20
> > Is there any reason for this or perhaps is it just an error ?
>=20
> Ah, I not notice the delegation issue. if you are concerned about this.=
=20
> I'll leave this to Joe and drop the patchset from my CI.

I looked over the patch and figured it was clear enough in
implementation to go either way, sorry for the confusion.

>=20
> Thanks,
> Peng.
>=20
> >=20
> > Thanks
> >=20
> > Patrice
> >=20
> > On 3/19/20 10:59 AM, Patrick Delaunay wrote:
> > > Use the weak function mmc_get_env_dev in mmc_offset_try_partition
> > > function to allow dynamic selection of mmc device to use and no more
> > > use directly the define CONFIG_SYS_MMC_ENV_DEV.
> > >
> > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > ---
> > >
> > >  env/mmc.c | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/env/mmc.c b/env/mmc.c
> > > index 251ad07d7c..902cca23ad 100644
> > > --- a/env/mmc.c
> > > +++ b/env/mmc.c
> > > @@ -24,14 +24,25 @@
> > >
> > >  DECLARE_GLOBAL_DATA_PTR;
> > >
> > > +#if !defined(CONFIG_SYS_MMC_ENV_DEV)
> > > +#define CONFIG_SYS_MMC_ENV_DEV 0
> > > +#endif
> > > +
> > > +__weak int mmc_get_env_dev(void)
> > > +{
> > > +	return CONFIG_SYS_MMC_ENV_DEV;
> > > +}
> > > +
> > >  #if CONFIG_IS_ENABLED(OF_CONTROL)
> > >  static inline int mmc_offset_try_partition(const char *str, s64 *val)
> > > {
> > >  	disk_partition_t info;
> > >  	struct blk_desc *desc;
> > >  	int len, i, ret;
> > > +	char dev_str[4];
> > >
> > > -	ret =3D blk_get_device_by_str("mmc", STR(CONFIG_SYS_MMC_ENV_DEV),
> > &desc);
> > > +	snprintf(dev_str, sizeof(dev_str), "%d", mmc_get_env_dev());
> > > +	ret =3D blk_get_device_by_str("mmc", dev_str, &desc);
> > >  	if (ret < 0)
> > >  		return (ret);
> > >
> > > @@ -114,11 +125,6 @@ __weak int mmc_get_env_addr(struct mmc
> > *mmc, int copy, u32 *env_addr)
> > >  	return 0;
> > >  }
> > >
> > > -__weak int mmc_get_env_dev(void)
> > > -{
> > > -	return CONFIG_SYS_MMC_ENV_DEV;
> > > -}
> > > -
> > >  #ifdef CONFIG_SYS_MMC_ENV_PART
> > >  __weak uint mmc_get_env_part(struct mmc *mmc){

--=20
Tom

--GyBFFrpYHGV4SYp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6fTnEACgkQFHw5/5Y0
tyyWXwwAsvnakTU7jJD7K41zcRC+OEA/V1ECs3RP/U/6RgPDEM8KyB1qe5HH6XlD
4Kk9giIefXTWmBHamD3ZQTGwUj7F/86bqFLK1GGQepxKVDIubjrrtn+RJTnv+bEz
XM2QQOaeNwpbM6hcFQMiTAAWMSHhBs5xT/uufarnqlNzmGVLruIPJWyVxJHWOdoI
44d/OaeEkxTl6WycbF2eo9aFihm/dsYNJ1MfvMdfdSUlWziEhx3jl50ixV9e4pN/
x3u9fHjr7DK0ou8PKhv6K3M1HCVLlRUzZb+a+q7OFvJeXz0isZI7XIJmPy7S456e
MygFPliEKR8flQOcDNeFOpEUWRIi+W5E9pTTKBNzzyGe/MCLV5rsE+FGOt5UvS2m
dGAXZaWcCBJoQIZZhw4szdLCPRLaOge4Cjlu9p+luwsw5SKIZeqe8r6sCN7oxP4o
JmGAGoD1r3UlgXo0OWHkkXJHO0PBRQg/wN5lVa67TFaK3+OjIx06U6k7dMuKNV9m
Eg6l96SJ
=BqJ2
-----END PGP SIGNATURE-----

--GyBFFrpYHGV4SYp0--

--===============5029206463245052024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5029206463245052024==--
