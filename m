Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C841D1E235B
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 May 2020 15:51:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AC4DC36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 May 2020 13:51:18 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EDCDC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1590501073;
 bh=QTSRocvfMf8hdeLsAcDPXSqSVa1aUU9gXFk9YD9BioI=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=ShgH6Ofqip+ZADcZ7FfvDvOynUhGeBjuWwaWas0QKugdU+xrqnZuCsEhcZelj8Mh5
 j/GM6dph+toJ1gIeYGd3ts7mZb1Qq/ohbmUneAuIPUgVVUq14wGF0HvsBsUuQouiQe
 beDggP8dl6LeXOQA2Oex5QjDs6brQUOQVQDLTeII=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.70] ([88.152.145.75]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2O6e-1jaoZC3vLi-003rEL; Tue, 26
 May 2020 15:51:13 +0200
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200526094802.10927-1-patrick.delaunay@st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Autocrypt: addr=xypron.glpk@gmx.de; prefer-encrypt=mutual; keydata=
 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 Eg==
Message-ID: <1be86021-f763-d969-fa8f-6efae454d7cf@gmx.de>
Date: Tue, 26 May 2020 15:51:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200526094802.10927-1-patrick.delaunay@st.com>
Content-Language: en-US
X-Provags-ID: V03:K1:xEB868FYPNoRHhvcFslC4m5wTN65Pdbr/b5+BDJgYtNCU30iMUD
 M4/eiA9v0RqnnRskMXTtBzlWiZ/IpJV6jkWXSzyfvAqPrFLPQlfc7ee/gvSN/7GemcZizke
 Fd2bkWT3OGhDm0x8Lx/NoygXgfLTK1IMFK2Qp3DTdHf57xUu44vxoxDfLt3xBMZ1GiJBkry
 Ny5Oplju10rAWaxzdniOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NnKlw/7CR8w=:x4SBCavf87BSOlrhPU+tCQ
 lNFDThaV4vrLLaMqQDk+v8hq40Gr3OFaU0Kb/WiLivjPORECv+Celiur6nTBLLkhz4qcSIGR8
 UkzRctssuPq1piNnsgdy+gxAubtQJNk828i68MHoeE7lSIoxRkd5gPH9eEFc7sM/mx0KUcS5P
 lTrmZNhecL5d3yeDagYO3a5BJGpywUFUxB9ufWEns25ikzD2b2HchkFldBQA7a6iWLV5uDIkE
 HdeXZNDaTxXzBNdcp1qs98UzyMoU3HOh4P54E2p3MXCHpIJwglMayEV8tujs1rKjF9+vkKDrT
 HfPz49zzIqdMwR0wBKP0Q46tEiLVX3lExjsKuIwh5R9gn7TSazpwoUCm3kjhE0Ha7SC8ZNhdt
 MLSc0otCZtHwE5+4O5Ls8jh5jrotz2Bjpo2IwiEIDVMEJIcfipcb7hgELunN8No1KRaCcIEpq
 fQ7ikdMBAFZC1XBRwPTE7j9OzUNbiabCUVYtHyr+hIJEOFNR8ON2ckQF23IBYscxBvngKODDj
 Bunvxw6UyK+d26XdP3C9INHErmMI1Squ2GpI7DBvvLt3TRbnCMCCo/WaV0HRwKm48uKoz0Kyr
 ESd3oAjJQmG4yUNGYMiomHNf4pinhTo5XtkUieexM4dQ3o/y9jcvC4edwTl1sQtj/KiARepWB
 GY1jSpwxBlv9fVU10qBsnS0WNpu8kODVmRhEdOGgRcCiYnoIfQVDJIO8yT3x4yfnxIfyXles7
 BccjxfbL7y0jcqU54M5hU4vbMKOyMZILUHo4/QEoI53uR2qMjsS3iHV9XxNIInUz7w0Ih97W2
 2H04TDtYj4TyUr202l0bmVzQCB9wG+9BvNDlCA5ua42xXy6zb+5DMRUQdaeR8MnLxGtOmvJ0s
 WlVWagvYFXu1CSouqTuov4s5SaRE0pjnGiYBIBdLCI+QBk4JKzSfMoHBpKzSJPm8bBNRJG9Wq
 dRy5gshjtwboQXL/0cPrij8K0UcuqY4PLj7aDULJ/f7q2cS3eUgSIIbCuoFEa8S9XUcmOPL2/
 eTfknLY9jMNzkjeX15YY26kxgUdpXC4OB0DTm4dlmGUZwsifW1aOzsJOKxXkoXxsDlitfAYva
 U8eAqPAPqtaMhulRneqyy+ikJNlxW2WsHrT6XYOd4Urk88D9tZNCZNp5pfJFw2CKp4cdYJz4V
 qPLulSphtTrVoJ3+Bfb1dgADCHg/8lULSnkFm40jL3fO6vUsxeKcqozMyzUZbruBm5j4Ftt2v
 13cUU/N/K9c/aQddN
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] doc: log: correct option name
	CONFIG_LOG_MAX_LEVEL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 26.05.20 11:48, Patrick Delaunay wrote:
> Replace CONFIG_(SPL_)MAX_LOG_LEVEL by the correct name as defined in
> common/Kconfig:
> line 668:config LOG_MAX_LEVEL
> line 688:config SPL_LOG_MAX_LEVEL
> line 708:config TPL_LOG_MAX_LEVEL
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

> ---
>
>  doc/README.log | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/doc/README.log b/doc/README.log
> index 1057981f45..170e4ba24e 100644
> --- a/doc/README.log
> +++ b/doc/README.log
> @@ -60,13 +60,13 @@ Enabling logging
>  The following options are used to enable logging at compile time:
>
>     CONFIG_LOG		- Enables the logging system
> -   CONFIG_MAX_LOG_LEVEL - Max log level to build (anything higher is compiled
> +   CONFIG_LOG_MAX_LEVEL - Max log level to build (anything higher is compiled
>  				out)
>     CONFIG_LOG_CONSOLE	- Enable writing log records to the console
>
>  If CONFIG_LOG is not set, then no logging will be available.
>
> -The above have SPL versions also, e.g. CONFIG_SPL_MAX_LOG_LEVEL.
> +The above have SPL versions also, e.g. CONFIG_SPL_LOG_MAX_LEVEL.

Please mention TPL and CONFIG_TPL_LOG_MAX_LEVEL here too.

@Simon:
It would be good to reformat the whole file as restructured text and add
it to the HTML documentation.

Best regards

Heinrich

>
>
>  Temporary logging within a single file
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
