Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5380F14BD37
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 16:48:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7369C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 15:48:40 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 693C3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 15:48:37 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d18so10602808qtj.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 07:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=bHjm6G1Rk8zJfPGNqidS5hZF1JC3RoxOY4jsxBuzXlc=;
 b=eMWB2Nz07Wf6asTCU79Ndfm/d3eJmb+MXJ3X3tpFm4ChxP6PAnBXeakDynbOTcZGpS
 hT3pGJO6m+zeRaa1SQeRzmL3Ujz+4toFfW5xEnqmj3KeSY01KMOG2a1/X0vtA4WMtevR
 JdPu0T5uaQXvGHuvup5Py+PqPp+rhQtuN1n3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=bHjm6G1Rk8zJfPGNqidS5hZF1JC3RoxOY4jsxBuzXlc=;
 b=GTSa/fGwEXkfCedZrK5kS10pzXLPu+kNDEpWqMyL2CzFi1Kh5Td2RCj4WQX4Pojxjd
 MnueSsibBIgvcaJo6ZgWS/z7fgl9xGTjoYhqEla6n18JnflyoU2pGIeV+TSGRTdP0Lhx
 dc6Gk3A1I/ahe1Du4mAV7Bq68lkLoD8dQ38MfdrsN+al8j59RaIR8VhUevs03LFzYw+f
 S9l2+A1pVa969kh/oNcsydfUMf3TGBplT/RDMR/oegupSIhcIkKg8RFKeuT2jJHjY7Xq
 kNSPTI+HrJWArFd2LxSojkiU+YB+EEjPQxNKFk7NPAlrjFZjHBo4yiz6LzHUBlztB2Hd
 zWMw==
X-Gm-Message-State: APjAAAXujp0BFe34WJpuN1kdbdYlNr9fJfWDVBQl2ZaRC7tTWOCR/2Oz
 riCObRQuUK/LJtUWr17uxX5oag==
X-Google-Smtp-Source: APXvYqyEycqI0hGsJvyrTSRvEaQOkyMVNhxFEwg+Y4ZbDhcrnk2YZfaNJp9RKN/XJ7xd4ES+3omALg==
X-Received: by 2002:ac8:5206:: with SMTP id r6mr20919860qtn.214.1580226515763; 
 Tue, 28 Jan 2020 07:48:35 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-c8bf-ac0b-31a4-d341.inf6.spectrum.com.
 [2606:a000:1401:86dd:c8bf:ac0b:31a4:d341])
 by smtp.gmail.com with ESMTPSA id w24sm2938478qts.3.2020.01.28.07.48.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Jan 2020 07:48:34 -0800 (PST)
Date: Tue, 28 Jan 2020 10:48:29 -0500
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de
Message-ID: <20200128154829.GS13379@bill-the-cat>
MIME-Version: 1.0
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Wen He <wen.he_1@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Anup Patel <anup.patel@wdc.com>,
 Eddy =?utf-8?B?UGV0cmnImW9y?= <eddy.petrisor@gmail.com>,
 Nikita Kiryanov <nikita@compulab.co.il>,
 Patrick Bruenn <p.bruenn@beckhoff.com>, Adrian Alonso <adrian.alonso@nxp.com>,
 Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, Baruch Siach <baruch@tkos.co.il>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Atish Patra <atish.patra@wdc.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 David Feng <fenghua@phytium.com.cn>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Hu <richard.hu@technexion.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Marek Vasut <marex@denx.de>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Sudhanshu Gupta <sudhanshu.gupta@nxp.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Uri Mashiach <uri.mashiach@compulab.co.il>, Sumit Garg <sumit.garg@nxp.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Vinitha V Pillai <vinitha.pillai@nxp.com>,
 Peter Griffin <peter.griffin@linaro.org>, Ian Ray <ian.ray@ge.com>,
 Simone CIANNI <simone.cianni@bticino.it>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Udit Agarwal <udit.agarwal@nxp.com>, Heiko Schocher <hs@denx.de>,
 Zhao Qiang <qiang.zhao@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Feng Li <feng.li_2@nxp.com>, Ye Li <ye.li@nxp.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 Parthiban Nallathambi <parthitce@gmail.com>,
 "Derald D. Woods" <woods.technical@gmail.com>, Breno Lima <breno.lima@nxp.com>,
 Mian Yousaf Kaukab <ykaukab@suse.de>, Gilles Gameiro <gilles@gigadevices.com>,
 Alison Wang <alison.wang@nxp.com>, Ken Lin <Ken.Lin@advantech.com.tw>,
 Ashish Kumar <Ashish.Kumar@nxp.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Yunfeng Ding <yunfeng.ding@nxp.com>,
 Raffaele RECALCATI <raffaele.recalcati@bticino.it>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Akshay Bhat <akshaybhat@timesys.com>,
 Ludwig Zenz <lzenz@dh-electronics.de>, Stefano Babic <sbabic@denx.de>,
 Rai Harninder <harninder.rai@nxp.com>, Igor Opaniuk <igor.opaniuk@toradex.com>,
 Anatolij Gustschin <agust@denx.de>, Tang Yuantian <andy.tang@nxp.com>,
 Antti =?iso-8859-1?Q?M=E4entausta?= <antti.maentausta@ge.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Patrice Chotard <patrice.chotard@st.com>,
 Vikas Manocha <vikas.manocha@st.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>,
 Markus Niebel <Markus.Niebel@tq-group.com>,
 Francesco Montefoschi <francesco.montefoschi@udoo.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
 Vladimir Oltean <olteanv@gmail.com>
Subject: [Uboot-stm32] Removing "fdt_high=0xffffffff" from board environments
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
Content-Type: multipart/mixed; boundary="===============6332784140259466248=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6332784140259466248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="15k5Fuw+yLfT1d9X"
Content-Disposition: inline


--15k5Fuw+yLfT1d9X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey all,

Relatively recently it's been highlighted that a number of boards are
disabling relocation of the device tree image in memory and this in turn
leading to various difficult to resolve bugs.  At heart, disabling
device tree relocation at boot is something that should be used in rare
circumstances (and more generally fdt_high / initrd_high set to where
they are already residing in memory, as a known, correct and aligned
address).

I would like to ask everyone to update their board config file to use
the bootm_size (or set CONFIG_SYS_BOOTMAPSZ) to the amount of memory
(size, not location) available to safely contain a kernel, device tree
and initrd for relocation.  Thanks all!

--=20
Tom

--15k5Fuw+yLfT1d9X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4wV8IACgkQh/n2NdMd
dlIqxRAAmIi3lLtNWY2duZE/iuR+PPRwkPN4K5QttO8uM9o5KM6YJJlLo2SJGg3P
2uQAn7idktMXPmZLOTWqs7FW/BPY2OIVyynCXNSdSykm2KqyTho9WqbUSq0ICz7c
VHKMeNq3ME6807Ebqr+//Smx8/E/sC6KzzuTS14asXXRlNasGsNj6gt1vSxG84Tw
l4LEn2impNJUUE3EI1QZftXyfvVkqs1gExgKh5bHJEs9w+h4gu7AQbx3t3n9twj9
B0J3nJRJxyq9o6bvGjeF0NGaQoplaNuElTTNxn+uaFzRkSxaSDM0+H+8/apIsReK
0JMpkBRJoZ92vPVBpfE6EFNIqsneMVEkPNyUEnGXpZeIVp3YcwN8WYDLyt8SGXbw
cD0RLCjnYlRszJTbukGAll2JCszxo9EgrJFFss9Pab/sXVZVHZSek6QatlXxFclR
0cSoTakkKU4dYCAK+a44xoUhln9U8vkuhJhEjRpFxfgoc5CRM9rFida3TlJqdICa
JbdZXOAmAG2S4QeMdJRf9YRJt0eIRZ+Crq/4IWw7SA2mhPIYGpcs++mQZm/FDC+U
esKdRtFcmVMcgdaoxQjtRILpEwCwHjZjH0ZTsBDpMj21JGqjCiPWpYQC9/cIvWOO
Q+EbAgiVfs3UoUkBJL3bmmKb8TV8xuTqpdd4zXuCbNrQmUv5/A8=
=0+TD
-----END PGP SIGNATURE-----

--15k5Fuw+yLfT1d9X--

--===============6332784140259466248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6332784140259466248==--
