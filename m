Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA2D667AC9
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 17:28:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5005C65048;
	Thu, 12 Jan 2023 16:28:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5590BC65E45
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 16:28:43 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5382185423;
 Thu, 12 Jan 2023 17:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1673540923;
 bh=krF2fZjIKukOzsMGhPHNMq/yGdvcipq1fMJ+R69SvK4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hBoKjExLl6s33wYsanbz0qpF/MWA1Jyk3JjhrjM9+i6N4MTZ4ITvOqeozq0rDf1w3
 yxoJom+9nRw9+UPQRlEzZFZcCN2jGto80PfdOAgtneUtw7vhHqAI8rcZg1nmmlr1z1
 lRNpmczlfVi+iJM21WwpeuxmCyQ5seFepoPMyDQM7EVeL47v3z1rPjBSEcGE4Lwg5X
 0pL3nsj+aMbaQMQZ4DBZk6F57yLg1sEvRUxzpiWx2c4PYpy/nX3ARf6gjHGzKTTP3k
 an4szqXNUWjGgDsU/dhbtotmMIHG409jLIFpl0ObxEMp6QEPJ0mm1tfbJJ9kbdO7Kc
 ODfCM294AqNuA==
Message-ID: <c85df3db-33a6-436a-edff-2e72845257aa@denx.de>
Date: Thu, 12 Jan 2023 17:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, u-boot@lists.denx.de
References: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
 <20221212104437.15838-2-fabrice.gasnier@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221212104437.15838-2-fabrice.gasnier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Thomas Huth <thuth@redhat.com>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/3] usb: onboard-hub: add driver to
 manage onboard hub supplies
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

On 12/12/22 11:44, Fabrice Gasnier wrote:
> The main issue the driver addresses is that a USB hub needs to be
> powered before it can be discovered. This is often solved by using
> "regulator-always-on".
> 
> This driver is inspired by the Linux v6.1 driver. It only enables (or
> disables) the hub vdd (3v3) supply, so it can be enumerated.
> Scanning of the device tree is done in a similar manner to the sandbox,
> by the usb-uclass. DT part looks like:
> 
> &usbh_ehci {
> 	...
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 	hub@1 {
> 		compatible = "usb424,2514";
> 		reg = <1>;
> 		vdd-supply = <&v3v3>;
> 	};
> };
> 
> When the bus gets probed, the driver is automatically probed/removed from
> the bus tree, as an example on stm32:
> STM32MP> usb start
> starting USB...
> STM32MP> dm tree
>   Class     Index  Probed  Driver                Name
> -----------------------------------------------------------
>   usb           0  [ + ]   ehci_generic          |   |-- usb@5800d000
>   usb_hub       0  [ + ]   usb_onboard_hub       |   |   `-- hub@1
>   usb_hub       1  [ + ]   usb_hub               |   |       `-- usb_hub
> 
> STM32MP> usb tree
> USB device tree:
>    1  Hub (480 Mb/s, 0mA)
>    |  u-boot EHCI Host Controller
>    |
>    +-2  Hub (480 Mb/s, 2mA)
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
