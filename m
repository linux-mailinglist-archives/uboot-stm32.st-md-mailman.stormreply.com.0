Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDDE39890E
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Jun 2021 14:09:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4517C57B6F;
	Wed,  2 Jun 2021 12:09:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ECB8C57B55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 12:09:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152C7lWH008683; Wed, 2 Jun 2021 14:09:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=F0zJ8x0HiLhxPqUOABDJs/HvP16r1TYc62b88/aIdAc=;
 b=2IH72LVZvIylZRZJE5nat3DDALQGfhq0Etv/V/kkI7/EWtMcEO8+nKBpByf2dG2Xy4z1
 viUEPM2wT0mNu/Ujgh4ZMlbLIf0dMPQfs7dWh4Ej5ySksnpv6ojdLHJSAwyqKLnM92S2
 1FRo55U3QkjH0BPWC9qRGAfwcrQMHCIyVnbBv6i5otfA2xSAKcl8AkviJKEYmOc72eUA
 AKVPhtbfb6WSE/5bQw5CRvanuz3TZpXmkAToCdMOmJaRINd3oiwD+x/7zSGt3t6WNjkI
 Fx2AuF62NYs25QFAX16mYOkh146XhXl1EBSNBSH83/wEJfo0xDkiCxVusDNqeXtE/6/q iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38x3guwy83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 14:09:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA3A8100034;
 Wed,  2 Jun 2021 14:09:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DE6720758E;
 Wed,  2 Jun 2021 14:09:20 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Jun
 2021 14:09:19 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210602135621.1.I567147108d7efaa02a3532cde06cf1d5df59ce38@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <8a96feac-a29f-ba95-d242-2e5b46d38c27@foss.st.com>
Date: Wed, 2 Jun 2021 14:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210602135621.1.I567147108d7efaa02a3532cde06cf1d5df59ce38@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_07:2021-06-02,
 2021-06-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] doc: usage: man-page for pinmux command
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

Hi Patrick

On 6/2/21 1:56 PM, Patrick Delaunay wrote:
> Provide a man-page for the pinmux command.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Dependency with [1] for the option <pin-name> for status:
> 
>   pinmux status <pin-name>
> 
> [1] cmd: pinmux: support pin name in status command
>     http://patchwork.ozlabs.org/project/uboot/patch/20210521094728.v3.2.I5b7085079ee5504cad399697bf6afef6710fa02a@changeid/
> 
> 
>  doc/usage/index.rst  |  1 +
>  doc/usage/pinmux.rst | 95 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 doc/usage/pinmux.rst
> 
> diff --git a/doc/usage/index.rst b/doc/usage/index.rst
> index 41b247bc62..e5717b7141 100644
> --- a/doc/usage/index.rst
> +++ b/doc/usage/index.rst
> @@ -36,6 +36,7 @@ Shell commands
>     mbr
>     md
>     mmc
> +   pinmux
>     pstore
>     qfw
>     reset
> diff --git a/doc/usage/pinmux.rst b/doc/usage/pinmux.rst
> new file mode 100644
> index 0000000000..9f4392cd0d
> --- /dev/null
> +++ b/doc/usage/pinmux.rst
> @@ -0,0 +1,95 @@
> +.. SPDX-License-Identifier: GPL-2.0+:
> +
> +pinmux command
> +==============
> +
> +Synopsis
> +--------
> +
> +::
> +
> +    pinmux list
> +    pinmux dev [pincontroller-name]
> +    pinmux status [-a | pin-name]
> +
> +Description
> +-----------
> +
> +The pinmux command is used to show the pin-controller muxing.
> +
> +The 'pinmux list' command diplays the available pin-controller.
> +
> +The 'pinmux dev' command selects the pin-controller for next commands.
> +
> +    pincontroller-name
> +        name of the pin-controller to select
> +
> +The 'pinmux status' command displays the pin muxing information.
> +
> +    \-a
> +        display pin muxing of all pin-controllers.
> +    pin-name
> +        name of the pin to display
> +
> +Example
> +-------
> +
> +::
> +
> +    => pinmux list
> +    | Device                        | Driver                        | Parent
> +    | pinctrl-gpio                  | sandbox_pinctrl_gpio          | root_driver
> +    | pinctrl                       | sandbox_pinctrl               | root_driver
> +    =>
> +    => pinmux dev pinctrl
> +    dev: pinctrl
> +    =>
> +    => pinmux status
> +    P0        : UART TX.
> +    P1        : UART RX.
> +    P2        : I2S SCK.
> +    P3        : I2S SD.
> +    P4        : I2S WS.
> +    P5        : GPIO0 bias-pull-up input-disable.
> +    P6        : GPIO1 drive-open-drain.
> +    P7        : GPIO2 bias-pull-down input-enable.
> +    P8        : GPIO3 bias-disable.
> +    =>
> +    => pinmux status P0
> +    P0        : UART TX.
> +    =>
> +    => pinmux status -a
> +    --------------------------
> +    pinctrl-gpio:
> +    a0        : gpio input .
> +    a1        : gpio input .
> +    a2        : gpio input .
> +    a3        : gpio input .
> +    a4        : gpio input .
> +    a5        : gpio output .
> +    a6        : gpio output .
> +    a7        : gpio input .
> +    a8        : gpio input .
> +    a9        : gpio input .
> +    --------------------------
> +    pinctrl:
> +    P0        : UART TX.
> +    P1        : UART RX.
> +    P2        : I2S SCK.
> +    P3        : I2S SD.
> +    P4        : I2S WS.
> +    P5        : GPIO0 bias-pull-up input-disable.
> +    P6        : GPIO1 drive-open-drain.
> +    P7        : GPIO2 bias-pull-down input-enable.
> +    P8        : GPIO3 bias-disable.
> +
> +Configuration
> +-------------
> +
> +The pinmux command is only available if CONFIG_CMD_PINMUX=y.
> +
> +Return value
> +------------
> +
> +The return value $? is set to 0 (true) if the command succeded and to 1 (false)
> +otherwise.
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
