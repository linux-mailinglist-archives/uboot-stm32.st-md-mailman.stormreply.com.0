Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D4164A2BD
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 15:00:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D724C65E74;
	Mon, 12 Dec 2022 14:00:38 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B23C0C65047
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 14:00:36 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id j16so8968836qtv.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 06:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ex1IlBmcwYh4Z0dvqOs++K52m22u6pctl9wquvu2Yno=;
 b=ZVrpBfkOAqhzzTqNA3z5Nb6haCRMU9/kgZ8q+E8xWPkDxEqlF8bKz3he8+LtI1Oweo
 QqgqdZp8IWxt7hxOhkXuiovbNMhPACSgtocNHmqrQeAgvm9kcSWJ8cgB9uOuUFIrZ27Y
 6Usfcd99l3yKZjpbhoyh5PM9km7w6zczvS31g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ex1IlBmcwYh4Z0dvqOs++K52m22u6pctl9wquvu2Yno=;
 b=IfdpRrL+afclU/blTip9UcVSFEwlMkWgEN8ikzMWwgs2bj7cSnki6DI24RaX21hNi2
 I8ApqShmymHB5gvFbBcGMOVYP1vDns8XWMnxL5MkA/U9mWIcYZ15P1q5acWPZJRqcPvO
 VbkUcRUIIp5X+bFFEFBhlOrxCONsjSG2VZ4toQoazau37ykZGit9vUo56OzuFPA5jv43
 e4xh4hKmrKwEzM7zd2ri+kPKiaS952VtlRNSc8W8Qnycmp/cUuQfJ3gHhRS+YBpIGqtR
 mQX+BgMat+lGbbv7O0NdmfDtIrArV60W/8HvVSBWh/nfE0JfNxGsEohxx+r4jSkJVHaJ
 KBXw==
X-Gm-Message-State: ANoB5pmHOTtIVJNCyHwHZIS1ajeKmGPkzmBM9qChQ4LTmzZqfNTCx2DK
 y8dfDHI6d3miwAnNvZyckbVqlQ==
X-Google-Smtp-Source: AA0mqf6OSbPsXvjyqVG23h2388ti9eN69pzijqUkre3Ui15S++mKWPsrDGGWb8HJmOIt2dIKTIM3DA==
X-Received: by 2002:ac8:6e84:0:b0:3a8:1c63:7603 with SMTP id
 c4-20020ac86e84000000b003a81c637603mr1516997qtv.57.1670853634862; 
 Mon, 12 Dec 2022 06:00:34 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-8c5e-02dc-44a6-fa90.res6.spectrum.com.
 [2603:6081:7b00:6400:8c5e:2dc:44a6:fa90])
 by smtp.gmail.com with ESMTPSA id
 bp12-20020a05620a458c00b006fef61300fesm5990058qkb.16.2022.12.12.06.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 06:00:31 -0800 (PST)
Date: Mon, 12 Dec 2022 09:00:28 -0500
From: Tom Rini <trini@konsulko.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20221212140028.GR3787616@bill-the-cat>
References: <20221128084122.3456680-1-max.oss.09@gmail.com>
 <20221128084122.3456680-2-max.oss.09@gmail.com>
 <20221208202410.GN3787616@bill-the-cat>
 <CAEHkU3WR8PKLHHjU7k6FK32mvpwxBenGkW_piQeabs9m4ogbgg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEHkU3WR8PKLHHjU7k6FK32mvpwxBenGkW_piQeabs9m4ogbgg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Du Huanpeng <dhu@hodcarrier.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Stefan Roese <sr@denx.de>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v5 1/1] u-boot-initial-env: rework make
	target
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
Content-Type: multipart/mixed; boundary="===============5733613521031997682=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5733613521031997682==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9ZK/CtYg56DKcyDv"
Content-Disposition: inline


--9ZK/CtYg56DKcyDv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2022 at 02:39:09PM +0100, Max Krummenacher wrote:
> Hi Tom
>=20
> On Thu, Dec 8, 2022 at 9:24 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Mon, Nov 28, 2022 at 09:41:22AM +0100, Max Krummenacher wrote:
> >
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> > > With LTO enabled the U-Boot initial environment is no longer stored
> > > in an easy accessible section in env/common.o. I.e. the section name
> > > changes from build to build, its content maybe compressed and it is
> > > annotated with additional data.
> > >
> > > Drop trying to read the initial env with elf tools from the compiler
> > > specific object file in favour of adding and using a host tool with
> > > the only functionality of printing the initial env to stdout.
> > >
> > > See also:
> > > https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@foss=
=2Est.com/
> > >
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > Acked-by: Pali Roh=E1r <pali@kernel.org>
> > > Reviewed-by: Simon Glass <sjg@chromium.org>
> >
> > Applied to u-boot/next, thanks!
>=20
> The commit not only fixes the use case on arm64 with LTO enabled, it also
> fixes sandbox for x86-64. For me on Fedora with a `gcc (GCC) 11.3.1 20220=
421`
> both `make sandbox_defconfig; make u-boot-initial-env` and
> `make sandbox_defconfig; <unselect LTO>; make u-boot-initial-env` fail wi=
th
> ```
>   GENENV  u-boot-initial-env
> objcopy: env/common.o: can't dump section
> '.rodata.default_environment' - it does not exist: file format not
> recognized
> sed: can't read u-boot-initial-env: No such file or directory
> ```
>=20
> Wouldn't that merit applying the commit to master, i.e. include it in v20=
23.01?

You can just disable LTO, and it's been an issue for a while now. It's
also easy enough to cherry-pick if there's cases out there that can't
wait.  Thanks again for addressing the problem!

--=20
Tom

--9ZK/CtYg56DKcyDv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmOXM/wACgkQFHw5/5Y0
tyysCAv/RzKcnSlRh5TXmkTTXH5ylyV51c8rLxA+bmannyzwxYe9uSbndZSGNpTm
jJIuiYX16uGvV2cehu16HaWMf1BD84kpIfX2y8iOEzrTWGCgJHi9G+mz7X/F71K+
xWSu+iGl+Te+MzEPYP/lvjkQluGeYYcqP1GOfYzGdVscaWey76g0P6xAza60XORO
UXI/MoQ36SvsosrGvFyiaRUIXwEHm46FbsI/FXwP9xm0p99MvW3wQQ3mAaP7v91H
+QKujWwzkFSmFpnTVhZFM2t0jbGfTD08nPNG6zvn0/5UDbWTFMiwr9OzXFm3RtlR
EGBKVGZMvB4z+qh5gsxIeYzojT4um9QIAArDZU2Dq9jf6YdVGWPlorwn+pqLsYPl
5MPpubpit2tVJT7Vof311BrfKawcvb6/1gosDfvbg2z3rEAvvbxcKIzgilhO0/ql
VS7RN4TomUrjztuEdkVfy4ykKWlZeE44Zey3k6tjtHsrsFiAEVJX0XQ0oGxVO7vK
9icY941r
=WAO6
-----END PGP SIGNATURE-----

--9ZK/CtYg56DKcyDv--

--===============5733613521031997682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5733613521031997682==--
