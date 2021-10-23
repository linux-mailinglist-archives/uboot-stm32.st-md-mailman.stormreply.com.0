Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 752DC438475
	for <lists+uboot-stm32@lfdr.de>; Sat, 23 Oct 2021 19:26:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10A45C5719E;
	Sat, 23 Oct 2021 17:26:00 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13C36C5719C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Oct 2021 17:25:58 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id c28so6445488qtv.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Oct 2021 10:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nzIOrhbd2Q5Uooy21ehoHu0sVCkDbF5EgfiC4dPKnuc=;
 b=SF6ZAdg5kDEnNncHV1HFFiFn4RBkcW2QlH9vYdRBBCNm8ag5KJpSo+LRRd/KsKbdCE
 Jee+7u9rdI3stwaKpGOyiHFwdzu040basWJjUvy7tiIZ77Fj6ZFrMdvsazoc2Fr/XM0m
 VTQElly0WxvOPbiFU0PXRE4qulzEJxDOE7/lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nzIOrhbd2Q5Uooy21ehoHu0sVCkDbF5EgfiC4dPKnuc=;
 b=6tKzVP5Ps4SoGq7f8CCyQo4nwUcrqC755i+Hy8L4WcXbOkNok/3SywJM4uS3lWbncn
 fsVqyK7+lURWjEiD+a2ObxgmNgXwRjv2i0H8pC5toMxiLMgMmsHQUNErN6BM/vC592Eu
 GHTWjxd3dj5pQr/NAx1e36a5Fs0JwBR3HD4J2YsnwUqHr0Hr9WGxW4I4MYpPiJNiPURb
 pxHc+cSMX8u6iOrKVVMsljSGNmlpxTqg+fxB4Oc6v6iV8QuZKECUgVFAXOba6dAQJJje
 tLa3FChBhQAhJPu4YV3QnZqH42LwCO6knuqqUBiuqqdK+yAmeufzHw36mSK1Ut1IJG6q
 dyOA==
X-Gm-Message-State: AOAM531aWZ/THaE38gh//LK6IPjDI1PV7J2VzyYo6U+YvBy5tkLjv4BF
 colz6YiO3nAFS4477beyW4bscA==
X-Google-Smtp-Source: ABdhPJzuLCPj+ZUzAjnUNh6+WrwMFIjuezRxpUqXM8i2DH523llNYoy5A9EsKAwRwNC11YE/tu6dGA==
X-Received: by 2002:a05:622a:191:: with SMTP id
 s17mr7454191qtw.18.1635009956896; 
 Sat, 23 Oct 2021 10:25:56 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-a9b8-aa6a-342e-19eb.res6.spectrum.com.
 [2603:6081:7b01:cbda:a9b8:aa6a:342e:19eb])
 by smtp.gmail.com with ESMTPSA id 14sm6651189qtp.97.2021.10.23.10.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 10:25:56 -0700 (PDT)
Date: Sat, 23 Oct 2021 13:25:54 -0400
From: Tom Rini <trini@konsulko.com>
To: Adam Ford <aford173@gmail.com>
Message-ID: <20211023172554.GO3577824@bill-the-cat>
References: <927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.com>
 <CAHCN7xJOtTDtF1BoNChO=_4OPmdPoJQ=zg3Of3y0RUJfrhabrQ@mail.gmail.com>
 <20211022212605.6ff8998a@thinkpad>
 <CAHCN7xKB_QZU8=sNV4n_kyAX=LSjtqFM=1J-96Yom2NJJco0zA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHCN7xKB_QZU8=sNV4n_kyAX=LSjtqFM=1J-96Yom2NJJco0zA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] Question: LTO and failing objcopy in
	"u-boot-initial-env" target
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
Content-Type: multipart/mixed; boundary="===============3537182756529677751=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3537182756529677751==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KDy5+/kaQUC2a3Gw"
Content-Disposition: inline


--KDy5+/kaQUC2a3Gw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 22, 2021 at 02:49:17PM -0500, Adam Ford wrote:
> On Fri, Oct 22, 2021 at 2:26 PM Marek Beh=FAn <marek.behun@nic.cz> wrote:
> >
> > On Fri, 22 Oct 2021 14:19:16 -0500
> > Adam Ford <aford173@gmail.com> wrote:
> >
> > > I am not sure it's the right solution, but it appears to work for me
> > > on a board that uses LTO.  I didn't try it with a board that doesn't
> > > use LTO.
> >
> > Need to be tested with GCC as well as Clang.
>=20
> Agreed.
>=20
> I turned off LTO, and got an error, so I updated the diff to:
>=20
>=20
> diff --git a/Makefile b/Makefile
> index 5194e4dc78..386180e935 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2303,7 +2303,7 @@ endif
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>=20
>  quiet_cmd_genenv =3D GENENV  $@
> -cmd_genenv =3D $(OBJCOPY) --dump-section .rodata.default_environment=3D$@
> env/common.o; \
> +cmd_genenv =3D $(OBJCOPY) --dump-section `${OBJDUMP} env/common.o -t
> |grep -m1 default_environment |awk '{print $$4}'`=3D$@ env/common.o; \
>         sed --in-place -e 's/\x00/\x0A/g' $@
>=20
>  u-boot-initial-env: u-boot.bin
>=20
>=20
> It now appears to build without error with LTO enabled and disabled.

I think LLVM is just not supportable without a different set of logic,
as env/common.o just isn't quite the same (with LTO it's an IR file,
without it's an object, but doesn't quite have that section?).

--=20
Tom

--KDy5+/kaQUC2a3Gw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF0RZ8ACgkQFHw5/5Y0
tyyvbQv/Vz7xuBnI/GhafsOzdXjsHaWq0UBO+uSY6Jgl+x6P5M4LAYGudXd1cR/3
/zX4wTj3pbbU47CXoO1h4Kdpud0KnUOlyY5vjbHyRcrawmkiJV/ggCY4RQ9j54hB
hjUA5CHRzZTZ23AmTWUEcmUMCcxmZ1nWKudCTIx96sv7IWF+bi48asTKfp0JCLgF
zHuNxzLphP+SE1myBJMFbYRfyQJ+UNr6dsrZZ5w+U/1dev3q96NyDq7BPWpZSJgx
RaQmlVvejBpFhx0OP8Ej11kpnxeHCWN20sJw0z5lbTyKT6rebE3R0Ifpdb3sheRL
hWjp7wX+myc+HWj4AGeZfdgNMitp68/TxAV7bGapuMNHCbJbgrGBdMBnCsibF1M4
FYnzs5LbvuR3ICNcNze+AMD5jHOp+U6tVGu2jkGjLi25o9+k3frsSJnd+oYeDCXg
1Lo8i+kgBv4cD7xVHFFv9zKJPuiBMqiElX+UIJ7L6BsCvdJIIQAr/H96uPH39Ux9
/j6L7+Du
=Xydl
-----END PGP SIGNATURE-----

--KDy5+/kaQUC2a3Gw--

--===============3537182756529677751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3537182756529677751==--
