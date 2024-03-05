Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92242871F6C
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Mar 2024 13:42:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B324C6DD69;
	Tue,  5 Mar 2024 12:42:58 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD8C6C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Mar 2024 12:42:56 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-68ee2c0a237so41526326d6.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Mar 2024 04:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1709642576; x=1710247376;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wk69115rxQ7gj5iSGgTkNwUAZw6Ry8B22GrBL+mokpY=;
 b=IebbgrDh1BDHkDjDudHqdP+zUNFTVuzuhITOjTmANYtSo62xCf44kFxvrHRjJaVRzg
 s+8UU4MozGGb9bD5sSu5jTLElgUB8NZLCe3ql4jYfZ9ik4DN6ewbFia2G/5Q5OG+d57x
 UNR5OFY11pOzn83b3aZdgEs+dPkI2/xnOsiiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709642576; x=1710247376;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wk69115rxQ7gj5iSGgTkNwUAZw6Ry8B22GrBL+mokpY=;
 b=poLN1FTC2rHg+KpmEHY4E0KxnHZuMVDVTiMEOGy9PzSeg0XJfvwGqpg6upHBF9gIDg
 yXk2wSQ3SeVFDKi6S695jX1zUf85P9wwBAE0vw4I6iCNGCBRzqmGbkvYJ9Mc8pEt44Jx
 AwVqe52Q0lVY/RPUnCYodWcGR4PD8U8q8OdVef9xiNdzmKwu4VCez9PjPIqktPw+vxdE
 y530cDS7xmDTFJbs4XqX0HnnLJnkP+ta/2MekOhSf1SKv4Db4ox6iRhI+NHSdWaKcfc7
 /5z7ClLreX3uxMWxnORNtyIZJst5hTnFf4IDHAFaqkrf/tTCPbeeYCcLaHAJtpAZQGwq
 akPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSf255DHJM5I6RWhL91zcxfoP/axr4xaZAeWkqRDmDG0b7yOD59JXdlTTxDKfr9zCzWKgQPd4ImQ0JONak2nCZ8holnmG+QTNut/G71C/I6w8saQztgnVm
X-Gm-Message-State: AOJu0YzeWtDRYUmN9LvXW8/eiEjnSdHYbnRg8h1UgoDTsCqD146RtIRL
 IvQSycVoMIlMGidH8uJEotsO1iM0CuelDtcYoNuTd8LnRB9sAX407lsZffvb700=
X-Google-Smtp-Source: AGHT+IFLNemNWxb6qjPWkXHj6fl0HhKSexUpwLRPqamXkhTxAKI2ZSemBXE9u8kgXTgwrXjDU6fpLg==
X-Received: by 2002:a05:6214:1255:b0:68f:5d7f:6a8d with SMTP id
 r21-20020a056214125500b0068f5d7f6a8dmr3197673qvv.3.1709642575818; 
 Tue, 05 Mar 2024 04:42:55 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-007f-0000-0000-0000-1000.res6.spectrum.com.
 [2603:6081:7b00:7f::1000]) by smtp.gmail.com with ESMTPSA id
 ol14-20020a0562143d0e00b0068ffdb8fb59sm6208452qvb.112.2024.03.05.04.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:42:53 -0800 (PST)
Date: Tue, 5 Mar 2024 07:42:50 -0500
From: Tom Rini <trini@konsulko.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20240305124250.GZ1523872@bill-the-cat>
References: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
 <20240304-b4-upstream-dt-headers-v1-26-b7ff41925f92@linaro.org>
 <CAFA6WYM6sTEdw+VphKidUqjQW61eW8ZVq+oO35CJVM=5wPoniA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYM6sTEdw+VphKidUqjQW61eW8ZVq+oO35CJVM=5wPoniA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ryder Lee <ryder.lee@mediatek.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot-amlogic@groups.io, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, Dai Okamura <okamura.dai@socionext.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Rick Chen <rick@andestech.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, uboot-snps-arc@synopsys.com,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Leo <ycliang@andestech.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>
Subject: Re: [Uboot-stm32] [PATCH RFC 26/26] dts: support building all dtb
 files for a specific vendor
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
Content-Type: multipart/mixed; boundary="===============0392255897506780675=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0392255897506780675==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KtIN09n0sxjAgv0F"
Content-Disposition: inline


--KtIN09n0sxjAgv0F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2024 at 06:05:52PM +0530, Sumit Garg wrote:
> Hi Caleb,
>=20
> On Mon, 4 Mar 2024 at 22:22, Caleb Connolly <caleb.connolly@linaro.org> w=
rote:
> >
> > This adjusts OF_UPSTREAM to behave more like the kernel by allowing for
> > all the devicetree files for a given vendor to be compiled. This is
> > useful for Qualcomm in particular as most boards are supported by a
> > single U-Boot build just provided with a different DT.
> >
> > Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> > ---
> >  dts/Kconfig          | 24 ++++++++++++++++++++++++
> >  scripts/Makefile.dts | 17 ++++++++++++++++-
> >  2 files changed, 40 insertions(+), 1 deletion(-)
> >
> > diff --git a/dts/Kconfig b/dts/Kconfig
> > index b9b6367154ef..67d9dc489856 100644
> > --- a/dts/Kconfig
> > +++ b/dts/Kconfig
> > @@ -100,8 +100,32 @@ config OF_UPSTREAM
> >           However, newer boards whose devicetree source files haven't l=
anded in
> >           the dts/upstream subtree, they can override this option to ha=
ve the
> >           DT build from existing U-Boot tree location instead.
> >
> > +config OF_UPSTREAM_BUILD_VENDOR
> > +       bool "Build all devicetree files for a particular vendor"
> > +       depends on OF_UPSTREAM
> > +       help
> > +         Enable building all devicetree files for a particular vendor.=
 This
>=20
> Do we really want to build all the DTBs even if many of those aren't
> supported by U-Boot at all? I would have rather added Makefile targets
> for boards which really supports a single defconfig eg.
> qcom_defconfig.

Yes, I think this target is useful as it addresses some of Simon's
earlier concerns with the feature.

--=20
Tom

--KtIN09n0sxjAgv0F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmXnE0cACgkQFHw5/5Y0
tyxtGQv/Wod2EBmX5FhenEgBCfdTBzSxdGJ5+X+907CEYEwKHQ2EKUD/rLyaYBWh
YoLu0e5mas2+3PSBBWdmvapYqusnc6vXxr53UYOSXkMzWuL1FeMvirhrelb1jdfC
S3bB3gnPMXZukz8q6DpsjfOpeAJiWPtYmSYJPZBq7aXgWusAFIb1aGEww+Zp2R+4
AZqwEuT0g4IBCJvjVg/B+QcaH8LivpTGBATr0kTMvRHRKuuu6qD0VqOKgiUVqQnW
Ls4aIfSm9ul0rUBEgkeatEVprJVO5wXxye6l1DXLCtsURyBmKpP9trV/ZLnzTDZN
sakhwNI+y1A36CFSM8EVFUcXqulgFD/OV0prY4nYZswhezgT/MOg4lWisSa1xJ/d
c2h1BWzsYIgNULElLCiStIZwpHI4hD09XL4T5whAEYYmX3NK4pK9gSq4M/JXhRCH
aJrCz952CoPnp/t3S8LJyW34GwdbOo1XfxlUPnoLv2EGMIAZKzEl5tX3wAyu3xNn
6Hcdp7my
=UZMy
-----END PGP SIGNATURE-----

--KtIN09n0sxjAgv0F--

--===============0392255897506780675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0392255897506780675==--
