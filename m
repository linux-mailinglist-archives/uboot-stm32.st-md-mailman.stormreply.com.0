Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B261CB652
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 May 2020 19:49:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEA29C36B0F
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 May 2020 17:49:43 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF358C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 17:49:42 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 23so1446124qkf.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2020 10:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2NLYX0htViNgJO69E+WFzrryEjhFp6AmDWWTdAYcm8U=;
 b=a0KR65GtaNucfb8aWO1mm6qzG2CURbMTd/j2j6gRkR7Y66DMafWTLZPiwBe9pHRovU
 +O/AfPh4nAghlvgBe+uT84JqAmGwuT8JSFfNslT+i2aaqiuCWVGZ+FquvfFphCGoRiDK
 DnTqWm7gfRjqvWSl4K3YuoBsU+ESBmKIzs8Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2NLYX0htViNgJO69E+WFzrryEjhFp6AmDWWTdAYcm8U=;
 b=QdY1IFYIEZ3t7dYgtBSEWg+WpOUINQi+30DIeHxcDMmPs3Py9BakCzKfq552ppzl42
 JiDd7YJkBYG/IKcOLe3e8thu4f94F6pR4iVugS1upuB9HL76v6Wm6yzscOpYhmn4qjor
 KGc9QyCF9v+HFM/x0XkMgQaddnId0evUXeDE+sw5xHyakUn840q9mc+zitedacvMjzX5
 i54CW7hL6VPCRL0i5OC2Vh066fWid/TItS93j5UEbQ+3NwEpTPb8PZ0n5MPB2BIVqR3S
 tu1w4sxL3RWdGcw/4viurNdQ5xMyUdWSgCbtHaZBM5rFgXMDdYvf5w/DO54C6sqQ3Npa
 vLig==
X-Gm-Message-State: AGi0PuZpmdByrQemI6x5WtHodJMsyQ1BDmtORt4WJSVzaXdx48W6thJL
 mfGjE7iMmMMk692+wW7HZFwHpA==
X-Google-Smtp-Source: APiQypKstEW/jZ4ohbbgJgmoOlEXPQnr7Kc3UQthj3gVfFLFcPL+eltNVky28tfGyN2S8Nb2kT9IfQ==
X-Received: by 2002:a37:b543:: with SMTP id e64mr3913574qkf.394.1588960181731; 
 Fri, 08 May 2020 10:49:41 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-d970-79cf-8141-588a.inf6.spectrum.com.
 [2606:a000:1401:826f:d970:79cf:8141:588a])
 by smtp.gmail.com with ESMTPSA id s15sm2042735qtc.31.2020.05.08.10.49.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 May 2020 10:49:40 -0700 (PDT)
Date: Fri, 8 May 2020 13:49:37 -0400
From: Tom Rini <trini@konsulko.com>
To: Michal Simek <michal.simek@xilinx.com>
Message-ID: <20200508174937.GK12564@bill-the-cat>
References: <f5214e0dd5f7a2c713f18d75727cc112d2d5e88b.1588593276.git.michal.simek@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <f5214e0dd5f7a2c713f18d75727cc112d2d5e88b.1588593276.git.michal.simek@xilinx.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Joel Johnson <mrjoel@lixil.net>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ian Ray <ian.ray@ge.com>,
 Thomas Hebb <tommyhebb@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Heiko Schocher <hs@denx.de>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Tetsuyuki Kobayashi <koba@kmckk.co.jp>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 Otavio Salvador <otavio@ossystems.com.br>, Thomas Weber <weber@corscience.de>,
 Tim Harvey <tharvey@gateworks.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>, git@xilinx.com,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>,
 Akshay Bhat <akshaybhat@timesys.com>, Adam Ford <aford173@gmail.com>,
 Ludwig Zenz <lzenz@dh-electronics.de>, Andreas Dannenberg <dannenberg@ti.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Anatolij Gustschin <agust@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>, u-boot@lists.denx.de,
 Simon Glass <sjg@chromium.org>, Holger Brunck <holger.brunck@ch.abb.com>,
 Mario Six <mario.six@gdsys.cc>,
 Masakazu Mochizuki <masakazu.mochizuki.wd@hitachi.com>
Subject: Re: [Uboot-stm32] [PATCH] cmd: mem: Remove
	CONFIG_SYS_MEMTEST_SCRATCH mapping
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
Content-Type: multipart/mixed; boundary="===============8294538613095946420=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8294538613095946420==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tHoXcMLEIE7biFzN"
Content-Disposition: inline


--tHoXcMLEIE7biFzN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2020 at 01:54:40PM +0200, Michal Simek wrote:

> There is no real need to exactly define space for saving patterns for
> alternate memory test. It is much easier to allocate space on the stack a=
nd
> use it instead of trying to find out space where pattern should be saved.
>=20
> For example if you want to test the whole DDR memory you can't save patter
> to DDR and you need to find it out. On Xilinx devices DDR or OCM addresses
> were chosen but that means that OCM needs to be mapped and U-Boot has
> access permission there.
>=20
> It is easier to remove this limitation and simply save it on stack because
> it is very clear that memory test can't rewrite U-Boot and U-Boot has also
> full access to memory where runs from.
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Stefan Roese <sr@denx.de>
> Reviewed-by: Heiko Schocher <hs@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--tHoXcMLEIE7biFzN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl61m7EACgkQFHw5/5Y0
tyztWwv/ZyQ9fIFO/Qp38BACiVRqd44ynuk4p0zEia3fXUkvctysW+hF7KKnRDm6
cVuiIM989Yldr/JC/KgcShHP572eaWqTfGedV7XS2cveBgHZN6NaGiPNWO2x6ZZR
OfSVn4kLTzuuDJELiCCfePhz2+DUpGbL8LNC+W8QHkYpYTDeDrIddrBDZdWp8VSV
Ui+Zp/AwuroM5bs2WtxPCU1HsspouDEzXYjHOW5YcUxehVXCrPKpH3uyeIudYpVS
ruJf6eP3kXQ3bZ2YYilvFDAZ0ZjzsliWX8eAUfLmbi+EyaK8ZONdfuFNZMySSdTg
rCyMFPiI13s2ZK75WmbS/KQZBtS6YbG8+OcgsHAFt32tWY4wcxoqePbJV3UP35rP
X1WHXy7Oc/z6SixA72gmomGZja2GISsjScnm5Q8fC58VhqVCye8bH6kCFpEwV+EG
iYCu8booJlRP8B3+fWPze+CgBZmxZLvNlN09FQK4jC534k4aMROE85S1gnliBIMd
tmSaEXP8
=d04h
-----END PGP SIGNATURE-----

--tHoXcMLEIE7biFzN--

--===============8294538613095946420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8294538613095946420==--
