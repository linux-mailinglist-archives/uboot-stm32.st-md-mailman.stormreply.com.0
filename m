Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA7479B8E
	for <lists+uboot-stm32@lfdr.de>; Sat, 18 Dec 2021 16:16:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 225A5C5EC6B;
	Sat, 18 Dec 2021 15:16:58 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A7F3C5A4FE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Dec 2021 15:16:56 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id t83so5151609qke.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Dec 2021 07:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iykDmReDBRMOD2QQa9zmp6mGxoAjqcmPade3oA78xSI=;
 b=TZqNzwdtjm4pts+8xWcLjb5Nc4/hGV1tA5vHq39pVXbb1OwFS6uFWBPn3sApyXxmZw
 hivZ//wLY9tz6212d1LAfIC3dxSYw5ofzvNdEDM+oRd6KoJSB2SlYY6y3Xr9dZfGey+N
 17cRrtlAAGj+1/G+LbwNBVYP9ruTHGm8g9SJjP3qeKjV4+G9svts9ssEfvC+w+7PaER4
 FquSNuK2rUsUEwG6WfJ4i5wUWBttXRWVv0Bpmq16RIIHuji0JrBOt33g3vAQFYUB45TM
 H+5qw36fBa2tD+iMwBt9jAPKERynmUcrLnMNHg+PgI56blSJOe02MOKR32943hLbS6LO
 bWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iykDmReDBRMOD2QQa9zmp6mGxoAjqcmPade3oA78xSI=;
 b=ZkN91ATCqVORG9jEUDWnsNPfSFLMlM3WfgrMh3EZmAPrT0nsbVu4DCv/PxLPvsX7Xo
 xgM/SaYcTFakhf2f44FU7djS+uNAsJnWD85VFZUL6+r1Z2WzaNH7XneEbOsSfsDkCuuk
 t+I6F8yCad3IOtM2DpRTWJrEsl6hINBUnXSWPYDsmshQO/Bu+RsdfudxkIMt8C8UA3Wj
 P+9w27hq3BHGjS/orOMGlhbTv8/p9lgLAjUPVO1IwLv1q4kdJV6VNUfp0yeLf3f080hj
 3kPYlfKzb5Q/InFZng0u0p7FQpjR9VxOS0Kqyw6x0sAUSI0iNu2KoVLR4t0sFAEzzzKi
 3m1A==
X-Gm-Message-State: AOAM533mbX9l4UQv0yu6YVMckRoMSGeQAMNpRBJ9rx+Xh4IE/U1OwXPp
 awPW2M3Av4n3LFMP56NlEc4JVxo2kzorug==
X-Google-Smtp-Source: ABdhPJyKD0Tudy8CvK2UVn+i03yEug9JQ7+cl8yArGDizkOM8oHajJdHPHJbql4AK9274K4LZlV8cA==
X-Received: by 2002:a05:620a:2699:: with SMTP id
 c25mr4857982qkp.511.1639840615060; 
 Sat, 18 Dec 2021 07:16:55 -0800 (PST)
Received: from [192.168.1.201] (pool-108-18-207-184.washdc.fios.verizon.net.
 [108.18.207.184])
 by smtp.googlemail.com with ESMTPSA id g12sm9673942qtk.69.2021.12.18.07.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 07:16:54 -0800 (PST)
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20211218150805.1083645-1-sjg@chromium.org>
 <20211218150805.1083645-3-sjg@chromium.org>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <f2c32018-7708-6384-fe59-c1d45846d866@gmail.com>
Date: Sat, 18 Dec 2021 10:16:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211218150805.1083645-3-sjg@chromium.org>
Content-Language: en-US
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rick Chen <rick@andestech.com>,
 Chin-Liang See <clsee@altera.com>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Wolfgang Denk <wd@denx.de>,
 Ran Wang <ran.wang_1@nxp.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Tom Rini <trini@konsulko.com>, Vladimir Oltean <olteanv@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>, Marek Vasut <marek.vasut@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 Wasim Khan <wasim.khan@nxp.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Grandegger <wg@aries-embedded.de>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>,
 Purna Chandra Mandal <purna.mandal@microchip.com>,
 Vitaly Andrianov <vitalya@ti.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Sandeep Sheriker M <sandeep.sheriker@microchip.com>,
 Olaf Mandel <o.mandel@menlosystems.com>, Anatolij Gustschin <agust@denx.de>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Dave Gerlach <d-gerlach@ti.com>,
 Pavel Machek <pavel@denx.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Andrew F. Davis" <afd@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Walle <michael@walle.cc>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alban Bedel <alban.bedel@aerq.com>, Priyanka Jain <priyanka.jain@nxp.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Dalon Westergreen <dwesterg@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] Convert CONFIG_TIMESTAMP to Kconfig
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 12/18/21 10:08 AM, Simon Glass wrote:
> This converts the following to Kconfig:
>     CONFIG_TIMESTAMP
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---

[...]

> diff --git a/net/Kconfig b/net/Kconfig
> index 3d3329912da..1983506bb8e 100644
> --- a/net/Kconfig
> +++ b/net/Kconfig
> @@ -109,6 +109,7 @@ config KEEP_SERVERADDR
>   
>   config UDP_CHECKSUM
>   	bool "Check the UDP checksum"
> +	default y if SANDBOX
>   	help
>   	  Enable this to verify the checksum on UDP packets. If the checksum
>   	  is wrong then the packet is discussed and an error is shown, like

Should this hunk be part of the previous patch?

--Sean
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
