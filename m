Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F11122ED60
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 15:33:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD5C9C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 13:33:24 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57214C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 13:33:23 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 11so15213442qkn.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 06:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OMPJ+C/zGvxWtxF+rmF88JKep4e2KJvxOIDgabUhQts=;
 b=kfc7d7GjJL+CfOzz4I64xXPLovy+gD/gg3x4gTui/pQK2+ldY2KARykMUhCDZzt0Uy
 ycdwyCtIT5HU6i85viRxbyv0sWNv/d1lFwl+Aw2RL2zala3vNrJYQzchjrj/XNgZLLMK
 uTeau0Gz+cMAvAhuUiM3y1sdn6MAE7JucaNDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OMPJ+C/zGvxWtxF+rmF88JKep4e2KJvxOIDgabUhQts=;
 b=lcVNmWfKAdH2TPxTYk2oF7zqpbbC6ZR0RZ8SQRpDeWIq7cUJT4UFTDR7WkZ5VsW1iQ
 Q+o+GsK/7sr3NL0lBamP1xD9wUshTypp/2UKYcFEi6FiVcgRsK2YP1tWlgdUi3bLiE7O
 o9gv6c5neqEJuFqgWP04Zicu51P45jECFyXn2bTp/7MUKKyKb+VMxj8Ue9ol50msEcq5
 oBEuady2tZ40wfPqOlFVkdoVQYb7ifXf/nBTTXMFauwCUjWOEoB70TfjxSza32eXDw4L
 o9xMLfIc9tvPAwuysm8lnHeokXqsswHv8wH7OwJfY7cDugMEvSosZAWLiWehiy+SOf7H
 +Jug==
X-Gm-Message-State: AOAM530eWrxyC56gkMRgK8DfUgOu1UPjRfy8pT3ssgkagh1UAX/3YHoK
 D8SZzC0d3EyWYU+KA1KDMGpy9inU8nr67g==
X-Google-Smtp-Source: ABdhPJwDbmahrqKVXfXfSN1UaG7gPQUQ0vK9g50dDvbD9QPBVEAuvxhE0/ng1AlmLhoPySGPzbGBXA==
X-Received: by 2002:a37:a98c:: with SMTP id
 s134mr22205809qke.397.1595856802253; 
 Mon, 27 Jul 2020 06:33:22 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-f1b9-a518-346f-c376.inf6.spectrum.com.
 [2606:a000:1401:8c61:f1b9:a518:346f:c376])
 by smtp.gmail.com with ESMTPSA id l5sm14166747qtd.37.2020.07.27.06.33.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 06:33:21 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:33:19 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200727133319.GI6965@bill-the-cat>
References: <20200615083857.3825-1-patrick.delaunay@st.com>
 <20200615103839.RESEND.3.I3f39ef337e2318d7c857e0458d5bc66e374dfaba@changeid>
MIME-Version: 1.0
In-Reply-To: <20200615103839.RESEND.3.I3f39ef337e2318d7c857e0458d5bc66e374dfaba@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Peng Fan <peng.fan@nxp.com>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH 3/3] env: mmc: add redundancy
 support in mmc_offset_try_partition
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
Content-Type: multipart/mixed; boundary="===============7312900940965756580=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7312900940965756580==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cW+P/jduATWpL925"
Content-Disposition: inline


--cW+P/jduATWpL925
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 10:38:57AM +0200, Patrick Delaunay wrote:

> Manage 2 copy at the end of the partition selected by config
> "u-boot,mmc-env-partition" to save the U-Boot environment,
> with CONFIG_ENV_SIZE and 2*CONFIG_ENV_SIZE offset.
>=20
> This patch allows to support redundancy (CONFIG_ENV_OFFSET_REDUND).
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--cW+P/jduATWpL925
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8e158ACgkQFHw5/5Y0
tyxkmwv/fEstFgtBSCp3nGy5Z7CiG/TV1ngxedQMG1vU2ZEp1XfZ0BuyZDDXcNKe
rUnbqBvCDteWyvtLa502uvH/3EOFDSu4rJUqlNogD4UMdSahp9bTScwVYYOkvK+n
wqCVXR4tgMgvjKEJWlxsY7U2XZ8MRRDCcx7WfCZ1FBvEkjDuf9JHl7DmK+hgpThI
jP5S7JBN8rHbiDsb6rhKY8EwhqpVP8LjkQYlgaCpOycGf9B2Wf5+dVO9uIni+QZp
tO1aSXJxjU4JBQ8MDykmB3PoZmbBjMKXhr0djOj2tEwZFOF0P2FIYQDs7b03LE0x
CPXhYY+MyCktnFgG2R7GqgRLpMBwoAc9RNClBZRJo3To3SSWnsWC6tafuElgISU3
oL+4Bs0vwnRdqGiAAq1RKK8Su9lxRq7c0oIryLIndE9tjm+0SLUQmXfUt3A6Xwtx
J/Ud/DC12OgR3grZHRjle/WvDr5f4gjtRN97IT1z32H7L+Ly0Dh4e8mun2AV1W9/
LIXlo1gV
=f5L4
-----END PGP SIGNATURE-----

--cW+P/jduATWpL925--

--===============7312900940965756580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7312900940965756580==--
