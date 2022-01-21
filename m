Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5A0496560
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jan 2022 20:02:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A5B4C5F1EC;
	Fri, 21 Jan 2022 19:02:40 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C121C5F1EB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 19:02:38 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id f5so10948060qtp.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 11:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n2baZZc/RYqOLtSijyBobBQqnqOWKKhXz/+bZ8IMlFc=;
 b=YrR4AH6GAUkgaoeebsehSw89rc0qzeqZkn9OmeO0vSYlL37Zk3NmoeXskZw7+LUwjt
 C2r9IewdODtyBpfAi9P4LEv/U3Xoow6NY/Z5BkS1VBPWoiEhjQ1PldYaJPm2V6GOWbYW
 tO6S38UBYOwOnSkBnCBc/CrC58bk7zE7MQbeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n2baZZc/RYqOLtSijyBobBQqnqOWKKhXz/+bZ8IMlFc=;
 b=MCG0EokHiQiVXDgoobCX9bBC/cDBZUd5Q5zbCVKPZtmv8sjT7J1ZKy8P0toQhp3BKD
 3ZHeIuJQm5Y8B9XUAtvIM5G0Tc5x/VkjWArNteth7ThK9ZjL5IRCIIU7Y66mqNkU3Siw
 +vmODGEbH6VA7naVTMm8wRIbfWevWJLcR3V3BJpUiyZ+G+qTEADxbZpj2TginBkUhm1P
 UcA9lrSZuifWJ7e95aMux1rtLwQ4tQlmC6C0jpKFxpt91XRqpWblyWnurjM4MF9KIMrx
 FuDm2R1KxpHhb0LJoC+mqxsp3BBSDUkodueES/n/hAhPFmcq24AnwngIi6zFdUv27D8r
 RWHQ==
X-Gm-Message-State: AOAM531Cfeqn01EZjo38lyF1S/Lg00vg0RxPPyrI1wn2BTMEuubCa3Dq
 kNFe9KNYaWJQt1HijTb00gDuUg==
X-Google-Smtp-Source: ABdhPJzra7d8z9tE/s2i0tJGKG4fgPTHl/Yi6Aey5fhdE6VIOvyggoY+T+0ld8yAW6HflIUtGQYwuQ==
X-Received: by 2002:ac8:5cc8:: with SMTP id s8mr4425139qta.550.1642791756971; 
 Fri, 21 Jan 2022 11:02:36 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id bp35sm3440557qkb.72.2022.01.21.11.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 11:02:36 -0800 (PST)
Date: Fri, 21 Jan 2022 14:02:32 -0500
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20220121190232.GD7004@bill-the-cat>
References: <20211218182752.1121322-1-sjg@chromium.org>
 <20211218182752.1121322-3-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20211218182752.1121322-3-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rick Chen <rick@andestech.com>,
 Chin-Liang See <clsee@altera.com>, Michal Simek <michal.simek@xilinx.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Wolfgang Denk <wd@denx.de>,
 Ran Wang <ran.wang_1@nxp.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>,
 Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Angelo Dureghello <angelo@sysam.it>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Marek Vasut <marek.vasut@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 Wasim Khan <wasim.khan@nxp.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Grandegger <wg@aries-embedded.de>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>,
 Purna Chandra Mandal <purna.mandal@microchip.com>,
 Vitaly Andrianov <vitalya@ti.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Aswath Govindraju <a-govindraju@ti.com>, Sean Anderson <seanga2@gmail.com>,
 Olaf Mandel <o.mandel@menlosystems.com>, Anatolij Gustschin <agust@denx.de>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Pavel Machek <pavel@denx.de>,
 "Andrew F. Davis" <afd@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Walle <michael@walle.cc>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alban Bedel <alban.bedel@aerq.com>, Priyanka Jain <priyanka.jain@nxp.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Dalon Westergreen <dwesterg@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/5] Convert CONFIG_TIMESTAMP to Kconfig
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
Content-Type: multipart/mixed; boundary="===============5177597225116660285=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5177597225116660285==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dex7YdYhTh9daYX7"
Content-Disposition: inline


--Dex7YdYhTh9daYX7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 18, 2021 at 11:27:50AM -0700, Simon Glass wrote:

> This converts the following to Kconfig:
>    CONFIG_TIMESTAMP
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--Dex7YdYhTh9daYX7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmHrA0gACgkQFHw5/5Y0
tyz7nAwAjLH8V+XtqoeFleSI9VYWElf1RbGHs0OYV/O5rybUuwq5lHQzXgLq2t1N
zWGpAuhlryemWsc1F4GjbOiL5VKDBsVTo1OFIJcEwaEfh6/sMRk31bvQueAwVGPC
6jUfHLvCsbKabJ4DtkTiUf+gLDodUgMbgCGmHRnxNIt++QLZUNofsuM7wke8uI6R
Re4xTxjm+OlQJLkeA+t5h+0iatGQqwOXv1WoYrko4zyRhJ6CWODgQcGHXEA1Om/e
sOEIVW6MWPLVYiW15I3ZQlZAOg+nRprwr1TpendJ2D6BFS0VsPThFJXBtMiVN5Zh
/MhsU4w99fP4sb1zic8px6aQ+d67eIgIwmIWJFD8gv3zmkN1Sf1/Ix7mvQJWGyX6
Jp35JwLAzfI40dqJ6lp6m5JSfkhRpC8PN0h4SjnOEyBFHvkqFsSst8sl1ZHIVWqR
PVsy4nSOasn6JXWlkzZAPdfoN9dM6QE2TmZYDsgPLOntPCBSgvR/7V2XQWspHCnf
tBHeinZl
=KOTl
-----END PGP SIGNATURE-----

--Dex7YdYhTh9daYX7--

--===============5177597225116660285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5177597225116660285==--
