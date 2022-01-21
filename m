Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C890149656B
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jan 2022 20:03:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8ECAFC5F1EC;
	Fri, 21 Jan 2022 19:03:23 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55CF5C5F1EB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 19:03:22 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id g13so8866409qvw.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 11:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H4Af6ZXOIG2Qny5Siv1JBq13S+AFT8VX0wdWyOhzgRo=;
 b=iBHpOddJXVjjQCzi35VXAlhu8hp/nTz4CgLDRlzq8xc7vhsaSmUyTEAGFepUFWUDFE
 4f+1+mfU8ni7JTdFJMu+AbSCKuufwXXq489jZdR4PqKQocIqoFhIZM8YOR5xObaQajMl
 k9ojP0+5GkuQR1Bchn0AwgmrO6YupEjVt3Gx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H4Af6ZXOIG2Qny5Siv1JBq13S+AFT8VX0wdWyOhzgRo=;
 b=IKWmt9juvHRkSAAu4cpOGwrotNsEiuKfiC43nbLS7DXZTYnLseVjUdogzKQuh4+u/Y
 gRhvdRRp7wLOynJsVmazRjKRdE9FHYmmI0Czyf2x6eGUJ0shMCx4AX+CS9rK9a9xQX1k
 hcVdebmTSS3A/dzKDJT2i9ykMZmgdsdZmzMqf9zCCrCfOqSQebGfflcpDPMa4gY8Z4Wz
 WSPvx4bwAxUtdYI7YrnbvXS3LvjFOi2LInciBV81kr6DmkCUjVCTC2dZrriL1HS7iZYZ
 OhbcsvxoTnRCZ/yfltkoNucOFG6qC8ljasOmncDFRxs/sA86VpkW4c9QiJJp5fUgOZgE
 dWsg==
X-Gm-Message-State: AOAM530RTCQxPAoIJU3z68SAgLEUAHdblPNTJKhha04jw/KZY58tRzWr
 nTGzDEaKq8101GfiBFwAFgumbA==
X-Google-Smtp-Source: ABdhPJxQV41h9vHtuitaT5HShkJskSUOZnRnNYs4L3uNSBil306GxZviSwWVZYrtK3exNJcIBGG/GA==
X-Received: by 2002:a05:6214:20e9:: with SMTP id
 9mr5035652qvk.17.1642791801333; 
 Fri, 21 Jan 2022 11:03:21 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id o126sm3284286qke.53.2022.01.21.11.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 11:03:20 -0800 (PST)
Date: Fri, 21 Jan 2022 14:03:16 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220121190316.GK7004@bill-the-cat>
References: <20220104132401.3573475-1-patrick.delaunay@foss.st.com>
 <20220104142328.v1.4.I0d0c7b01c8aefb9ef4b2d5f78feda422bc59593e@changeid>
MIME-Version: 1.0
In-Reply-To: <20220104142328.v1.4.I0d0c7b01c8aefb9ef4b2d5f78feda422bc59593e@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: David Feng <fenghua@phytium.com.cn>,
 =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>,
 Siew Chin Lim <elly.siew.chin.lim@intel.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Peng Fan <peng.fan@nxp.com>,
 Chin-Liang See <clsee@altera.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, Rainer Boschung <rainer.boschung@hitachienergy.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Wolfgang Wegner <w.wegner@astro-kom.de>, Kamil Lulko <kamil.lulko@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Dalon Westergreen <dalon.westergreen@intel.com>,
 Aleksandar Gerasimovski <aleksandar.gerasimovski@hitachienergy.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefan Roese <sr@denx.de>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Stelian Pop <stelian@popies.net>, Niel Fourie <lusus@denx.de>,
 Lukasz Majewski <lukma@denx.de>, Kristian Amlie <kristian.amlie@northern.tech>,
 egnite GmbH <info@egnite.de>, Ruchika Gupta <ruchika.gupta@nxp.com>,
 Shengzhou Liu <Shengzhou.Liu@nxp.com>, Dirk Eibach <dirk.eibach@gdsys.cc>,
 Heiko Schocher <hs@denx.de>, Qiang Zhao <qiang.zhao@nxp.com>,
 Ilko Iliev <iliev@ronetix.at>, Thomas Chou <thomas@wytron.com.tw>,
 Tetsuyuki Kobayashi <koba@kmckk.co.jp>, Sinan Akman <sinan@writeme.com>,
 Vikas Manocha <vikas.manocha@st.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 Ashish Kumar <Ashish.Kumar@nxp.com>, Rick Chen <rick@andestech.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Jens Scharsig <esw@bus-elektronik.de>,
 Vladimir Zapolskiy <vz@mleia.com>, Adam Ford <aford173@gmail.com>,
 Mingkai Hu <Mingkai.Hu@nxp.com>, Simon Guinot <simon.guinot@sequanux.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Michal Simek <monstr@monstr.eu>,
 Masakazu Mochizuki <masakazu.mochizuki.wd@hitachi.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Max Filippov <jcmvbkbc@gmail.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, "Andrew F. Davis" <afd@ti.com>,
 Aaron Williams <awilliams@marvell.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Walle <michael@walle.cc>, Paul Burton <paul.burton@mips.com>,
 Usama Arif <usama.arif@arm.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 TsiChung Liew <Tsi-Chung.Liew@nxp.com>, Bin Meng <bmeng.cn@gmail.com>,
 Andes <uboot@andestech.com>
Subject: Re: [Uboot-stm32] [PATCH v1 4/5] configs: Migrate
 CONFIG_SYS_MAX_FLASH_BANKS to Kconfig
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
Content-Type: multipart/mixed; boundary="===============4835598170869772503=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4835598170869772503==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rtqL2qczZrjpIe/F"
Content-Disposition: inline


--rtqL2qczZrjpIe/F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 04, 2022 at 02:24:00PM +0100, Patrick Delaunay wrote:

> Use moveconfig.py script to convert define CONFIG_SYS_MAX_FLASH_BANKS
> and CONFIG_SYS_MAX_FLASH_BANKS_DETECT to Kconfig and move these entries
> to defconfigs.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Stefan Roese <sr@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--rtqL2qczZrjpIe/F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmHrA3QACgkQFHw5/5Y0
tywn4Qv+Pja1oxTum8JwTAwicEfh/V73C3QMUk/6PHiqxmdcBq2Ltyz/hDiZoxU1
YaxeHv4Kzae0x3nfCr+xT4KVkkRVJoMEaDgnthAdteIWVw9rot+e5xUxoLGbrew7
faU6RZiz8lWRzsXZO/EswYvuyprcS+N82S6/AMCylM6nuX2fmqYk03vihD39sOl0
pAmyyypu/eu0I9NZB1BmJV8bHQaCV7DysQiR3sGMQlAc+fTze+xXG18fKc0NPEso
7RzJe5ItQI68GBPYVhs9/SJUzMmWcstLO83pfGlR3XrvOGsyuGxQh9S1Pfbjfyud
InITFnCj6vyBnnC87OtFaHjbnCmD5zIpKps1tgLd2YeMIef15NPLf9Lf9hHL3C/d
RY3qPrfusIFHY+tEsY0rhoKbUIB6UkexVgOdFGpGUYZPY2z87GaMeMIvYUSDavrX
HYwFIHmecUn6VRvpvzdhVHSrE1J+oEKu5bb9pHJXAgpTg2bY5V9R3EtVPbGuRdx6
knl7dFLF
=qHoW
-----END PGP SIGNATURE-----

--rtqL2qczZrjpIe/F--

--===============4835598170869772503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4835598170869772503==--
