Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6028E6152A3
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Nov 2022 21:00:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A461C64104;
	Tue,  1 Nov 2022 20:00:43 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDC63C64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Nov 2022 20:00:41 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id o28so7706874qkl.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Nov 2022 13:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2FHLhECpYZS0PwsqJWvZdPz/zfDXjCzymfpU7La+XqA=;
 b=I03sDmzivEOj97Vp7yMqK1qs5gzM8up7capJBhZ+6rArrr0ezel/X7fbKYjzKMqPy/
 cQ2ISYOrrQ3wNZR+5MD5MQdMzoYGjmwswYkKfXjpaT7o27ExZobO2HvhHx4MysWFmFDa
 pmQSyezuV//ko9NcpVIkkcE86jl8G+U6+jNt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FHLhECpYZS0PwsqJWvZdPz/zfDXjCzymfpU7La+XqA=;
 b=ftdZoaMU3He69M0S0ybg4cWRJ/mOH8w2BVC3esEdtMDqHG2qLqfFp9pbNkssnrqBDW
 TQQjMnife7qKuFSsguj6C4kS+KFdS3Fm0I1WiTsDF1+KV7/+a05T7YYJ6KuuRTHKUJOm
 bvfdInshnA9l38VpAX6uW4NA52pe9AqgKUfk8y7WOFQuHQyUxYjAKwhd7Sd70Z5c/Ge1
 vmGLhiwDoiB4MvCOoM1Mz3VTEPmCLksrVLpQNI69DAwPN1+2JrTP7WVx8B+qYKNZ8Qts
 NNxpEefKT94Q0ajUXaH3Dow5tdj4iwG6iJ356xTL93DsAcdLETv1L8wlQP3gw2clqSa1
 hSMA==
X-Gm-Message-State: ACrzQf2l1EavEOIGuDg+UDvOtLbLl4SyBM2xxYmUlfuJYzkb/QNgmkIC
 zVw5C0iy5K9fTlj6hRUTxoIJOQ==
X-Google-Smtp-Source: AMsMyM7//8dibABSBFSBUEmMJ4u8ZdBNYDd/gP3UN4i08MvnfFb6OBMa9YJFEGJVCjIOPgfI/btVVQ==
X-Received: by 2002:a05:620a:2984:b0:6ee:cc6b:5945 with SMTP id
 r4-20020a05620a298400b006eecc6b5945mr14296231qkp.323.1667332840709; 
 Tue, 01 Nov 2022 13:00:40 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-e15b-227c-17a8-c48a.res6.spectrum.com.
 [2603:6081:7b00:6400:e15b:227c:17a8:c48a])
 by smtp.gmail.com with ESMTPSA id
 bn4-20020a05620a2ac400b006f9f714cb6asm7005950qkb.50.2022.11.01.13.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 13:00:40 -0700 (PDT)
Date: Tue, 1 Nov 2022 16:00:38 -0400
From: Tom Rini <trini@konsulko.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Message-ID: <20221101200038.GL2116612@bill-the-cat>
References: <20221028161850.565610-1-max.oss.09@gmail.com>
 <20221028161850.565610-2-max.oss.09@gmail.com>
 <20221028164047.ljcy67r2itkkrkeb@pali>
 <CAEHkU3U_xmv6dHvtgSc8Eh0_x6zmdjRj3kVwaRaK2RYjqxST0A@mail.gmail.com>
 <20221101173504.25gdj4by7wqclvsv@pali>
 <20221101194834.GK2116612@bill-the-cat>
 <20221101195509.bmpsxmhii2wya4f3@pali>
MIME-Version: 1.0
In-Reply-To: <20221101195509.bmpsxmhii2wya4f3@pali>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Max Krummenacher <max.oss.09@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/1] Makefile: rework
	u-boot-initial-env target
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
Content-Type: multipart/mixed; boundary="===============0936525051419546274=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0936525051419546274==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rPF8rPXpDlNr1aSW"
Content-Disposition: inline


--rPF8rPXpDlNr1aSW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2022 at 08:55:09PM +0100, Pali Roh=E1r wrote:
> On Tuesday 01 November 2022 15:48:34 Tom Rini wrote:
> > On Tue, Nov 01, 2022 at 06:35:04PM +0100, Pali Roh=E1r wrote:
> > > On Monday 31 October 2022 11:51:45 Max Krummenacher wrote:
> > > > On Fri, Oct 28, 2022 at 6:40 PM Pali Roh=E1r <pali@kernel.org> wrot=
e:
> > > > > On Friday 28 October 2022 18:18:49 Max Krummenacher wrote:
> > > > > >  quiet_cmd_genenv =3D GENENV  $@
> > > > > > -cmd_genenv =3D $(OBJCOPY) --dump-section .rodata.default_envir=
onment=3D$@ env/common.o; \
> > > > > > -     sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '=
/^\s*$$/d' $@; \
> > > > > > -     sort --field-separator=3D=3D -k1,1 --stable $@ -o $@
> > > > > > +cmd_genenv =3D \
> > > > > > +     scripts/printinitialenv | \
> > > > > > +     sed -e 's/\x00/\x0A/g' -e '/^\s*$$/d' | \
> > > > >
> > > > > I think that you do not need this sed anymore as you print newlin=
e in
> > > > > host tool.
> > > >=20
> > > > Missed that one, will change in a V3.
> > > >=20
> > > > >
> > > > > > +     sort --field-separator=3D=3D -k1,1 --stable -o $@
> > > > > >
> > > > > >  u-boot-initial-env: u-boot.bin
> > > > >
> > > > > It is needed to update dependencies for u-boot-initial-env target=
=2E Now
> > > > > it does not depend on u-boot.bin but rather on printinitialenv to=
ol.
> > > >=20
> > > > I'm unsure if that is the best way forward. The initial solution wo=
uld
> > > > also not need to depend on u-boot.bin but rather on env/common.o.
> > >=20
> > > Yea, it was wrong too.
> > >=20
> > > > I guess that the intention was that the U-Boot binary and the
> > > > u-boot-initial-env file should not be out of sync.
> > >=20
> > > This is not possible to achieve with Makefile build system and is
> > > probably also against the logic of make to achieve the best paralleli=
sm
> > > during build of the project.
> > >=20
> > > In _my_ opinion, Makefile targets should have correct dependencies, on
> > > which they depend. This will prevent circular dependences and also
> > > faster building as make tool can run in parallel as much jobs as
> > > possible -- and do not have to wait until main u-boot.bin is built and
> > > then call other jobs.
> > >=20
> > > Tom, or do you think something different?
> >=20
> > Well, this tool has the same environment requirements as tools/env does,
> > so we should be able to use the same dependency info?
>=20
> Yes, build tool is _able_ to use it. (I think we all agree on this
> ability of make)
>=20
> But the question is if it _should_ be used. Because Max wrote some
> arguments why not to use this env dependency info.

Er, I'm lost I guess, sorry. Yes, it should not depend on env/common.o
nor u-boot.bin. I guess looking again, we can't borrow just the envtools
rules as we also would need to update the section that adds
$(defaultenv_h) to envtools would also need to be done for this tool.

--=20
Tom

--rPF8rPXpDlNr1aSW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmNheuEACgkQFHw5/5Y0
tyxFPwwAinCyKqIO2ezJ+Ldy9Gy0nLbg3i83AGF+0dyHHnMWgnVp0fdMwDa1Nidz
oAPQm4gemdT3CBkKgntrcHFKlYfz3GpcX8fnQajeTaYIoYArjheBSjqyxvUVgPIR
u1WGzTiNmJgm9IswAHo6EBCsjNouvvu6JlsijyhUZMZXP9D07eEiRI2aqLrR+HlV
LeD5O7WwRqUFbzo5s1LIRBt35pKqc/QBg29f4lKjNBOD5T5WUm5WkpMkOAeNB3jo
vaIZKS3s2upAqfhmisYzifYIJpfByUTxN1j0IdKnyvB1qMwGwxEcJGKYG67tupC9
MpufSvsJbMqgvK5M2W+ttOs+krzLsYvnyOlGL03OXqyouHc18AwIeXQ+L5EJC+AV
08/3r/rPTelJCS4xL77D62W7oN5iV4MtMTR2lJn6Ah6k6xEzlU1nHW0LUFtAgfY6
F4B/FmiGz9h+HLi/XqAKl34/5eYflyOqOOVdey0FZaBuqEATrLWEmoQOsYj0fkry
utoQK9Lz
=ZqNn
-----END PGP SIGNATURE-----

--rPF8rPXpDlNr1aSW--

--===============0936525051419546274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0936525051419546274==--
