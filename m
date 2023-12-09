Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 495AC80B5F7
	for <lists+uboot-stm32@lfdr.de>; Sat,  9 Dec 2023 20:09:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6272C6A613;
	Sat,  9 Dec 2023 19:09:37 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71F64C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Dec 2023 19:09:36 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-db537948ea0so3122186276.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 09 Dec 2023 11:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1702148975; x=1702753775;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hAaCL7BYmZMnuSKoibN7rs7/9V7TiLn5z7cfjm6tVjY=;
 b=dRg3QNPcAta0+k3KgPWoxKnVXH/i0sNgCihto7YZzz5OA7dw4+2go7zPFPX/hM8//E
 l9JPV+mx5rx2qqoFDoeiRzza9kIDcBGnMSzEMS/Fn2F383uD+P+GJzfPS6fTa+ChjyfZ
 ny8HMcsZeDSDku41pfzO2pIYKujdaDrWB+q0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702148975; x=1702753775;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hAaCL7BYmZMnuSKoibN7rs7/9V7TiLn5z7cfjm6tVjY=;
 b=RMNQS5kXy+0E5fx9QlwfigyZCoy3vUv7lWUv4ZDjt3Bph4TFLucbMOEqfWchsjW2D1
 Apd4MwcRsljkxO8FKY3pPkGAIKRMGnyjainNycZFrnCrA57wu3BUPN44DUNof7HIrJOo
 UiO44tm5SRrsjM+G/3vd5CzP+qyyYtKAc0Rcfzqqk/kzsynX/VpLGlxU9Zxla3lah7wn
 THmPw1tzmmvDEHDNsvKlNGODbYQQjUziR08GxWtKCsGq8K/ru7oYkYCDJKmsmniZYsHq
 7lIeN4UT99JRm04d9ovkJu1j8tfrrWtI//w9qypOuxXBX5HytIGWUvrKShijck+q/9wm
 fIbA==
X-Gm-Message-State: AOJu0YyTDMUTfiXTCoIZwMtFhqiMJYR7hNZJfsk3LIuD1++z9ux1mYJR
 AHdishiKhnOLFbTlE/IPMGP5fg==
X-Google-Smtp-Source: AGHT+IH8FTtoV4LCORXGJ+R6BHeB5aH+dJQUVyWeNCHkuUcuDO2DyMTwIqTO/zJsccalwWf7/X4yjw==
X-Received: by 2002:a81:49c2:0:b0:5d3:d6c3:dca with SMTP id
 w185-20020a8149c2000000b005d3d6c30dcamr1568268ywa.21.1702148975323; 
 Sat, 09 Dec 2023 11:09:35 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-b2bd-da43-c83a-80e1.res6.spectrum.com.
 [2603:6081:7b00:6400:b2bd:da43:c83a:80e1])
 by smtp.gmail.com with ESMTPSA id
 i75-20020a816d4e000000b005d78504d649sm1663917ywc.46.2023.12.09.11.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 11:09:34 -0800 (PST)
Date: Sat, 9 Dec 2023 14:09:32 -0500
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20231209190932.GZ2513409@bill-the-cat>
References: <20231204002642.895926-1-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20231204002642.895926-1-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Eddie James <eajames@linux.ibm.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com, Max Filippov <jcmvbkbc@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Sean Anderson <sean.anderson@seco.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Scott McNutt <smcnutt@psyent.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Alison Wang <alison.wang@nxp.com>,
 Safae Ouajih <souajih@baylibre.com>, Michal Simek <michal.simek@amd.com>,
 Leo <ycliang@andestech.com>, Nikita Shubin <n.shubin@yadro.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot Custodians <u-boot-custodians@lists.denx.de>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Chanho Park <chanho61.park@samsung.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 00/18] Complete decoupling of bootm logic
	from commands
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
Content-Type: multipart/mixed; boundary="===============3493213822087398842=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3493213822087398842==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UjHsMEPOxitlg71z"
Content-Disposition: inline


--UjHsMEPOxitlg71z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 03, 2023 at 05:26:16PM -0700, Simon Glass wrote:

> This series continues refactoring the bootm code to allow it to be used
> with CONFIG_COMMAND disabled. The OS-handling code is refactored and
> a new bootm_run() function is created to run through the bootm stages.
> This completes the work.
>=20
> A booti_go() function is created also, in case it proves useful, but at
> last for now standard boot does not use this.
>=20
> This is cmdd (part d of CMDLINE refactoring)
> It depends on dm/bootstda-working
> which depends on dm/cmdc-working

Since I would ask "what's the size impact of all of this?", I went and
checked. I rebased your current cmdd-working branch on top of current
next, and compared. While I'm sure this will change a little given
feedback so far, generally platforms shrink a little (probably due to
the bootm args stuff you dropped, but may need to keep). The only big
growth I saw was branch specific and your "rpi" patch, oh yes, that
grows rpi_4 given that you change a bunch of stuff there. So that
doesn't count.

So generally speaking, I'm OK with this series up to cmdd-working, and
will continue catching up and providing specific feedback.

--=20
Tom

--UjHsMEPOxitlg71z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmV0u2kACgkQFHw5/5Y0
tyxSigv+IZ4ufD+fIfkPuYLNx9+PKyqjDrgpua68CZ++L8UZ2QuAckn4LSkpx39O
DDUlm86F3LUm1ZtC2Xh8rD5Zh8pHOs79+7OTpd483CpbZXrhDyC8lQyx5CP5+8V2
g78JsFFT1BTOQ5T3Kl3MaweeZcuEtyRc0QX9XUCjY/ZX5c8EjC0FDaoxf6vPYauX
F4AK6QqsOXW+oKz8ktifukAHm0p1YgOZJLflUxTzYVEuwBdhXM5g8Sb+vSmCxNP4
Hiqifk75yInO8abtgpFaGgE9aCyzLeXwC5izNOcMN7O++8bcZXnoS3T4Rsmg47uR
YDPKogcguiVlZGK3TTWry88quimCxmTZwmXhbz8KPh2JEdYbqTmPtH27sCjUQSBs
+Z3QM6ZTi4fjlGZF6uhZcaLCi9R0agxD8vh9WZvbkMydy9Hls1coW+HnfCRdRc90
3Nz5VL9h2FFZVRdyw/HmS+LGJq16VNh5ShG6Gnka8e1SgNtSpuKaUfcYq9+wH+Gl
7gDJTX2G
=UVkb
-----END PGP SIGNATURE-----

--UjHsMEPOxitlg71z--

--===============3493213822087398842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3493213822087398842==--
