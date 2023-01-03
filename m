Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9F65C3F7
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 17:34:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A8FBC65048;
	Tue,  3 Jan 2023 16:34:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E74E9C03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 16:34:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303EHQcW014931; Tue, 3 Jan 2023 17:34:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UpQPrrk1rj6GbWz4mpwKFI+q1HsIEUhNbTVTA8Si8zs=;
 b=KSG6gJK4VJzUo/M0FbEScAireoKi17LINoA35CwGyQ8bCYf5Xgd7OJ5jdrKM258qjqk5
 dLnvBSLabRrlSU/0LW8k3x+hnaYjjfvb5qvIbBODLLKzOacMhmbMCnRxpYE1Whg+zKDv
 gM9eM8aWVzNlH5tTcgSTZXL2uNQaRUvx+Ghkj/0mkVJfKH3kr9kirVdC5gG7PRuvWmxO
 mf8+k/4JCKddFLm3OXQdsvZ8fGfN3PYL2xWBpB1W2h1Am5QIHR8vAO02Stp1j5bw2lwy
 jtOQD/6Xy5tfUuFxKK0pOJz3T59M1mnjSclF90/JNnIEALSZ9+wZAEeuwPpuananB9TV xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtda65xg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 17:34:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B49AD10002A;
 Tue,  3 Jan 2023 17:34:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD86622A6FD;
 Tue,  3 Jan 2023 17:34:16 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 17:34:15 +0100
Message-ID: <530438bb-c270-f36b-025e-5d3d3f335fc3@foss.st.com>
Date: Tue, 3 Jan 2023 17:34:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
 <20221212104437.15838-2-fabrice.gasnier@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20221212104437.15838-2-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_05,2023-01-03_02,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Sean Anderson <sean.anderson@seco.com>, Simon Glass <sjg@chromium.org>,
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

Hi,

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
> ---
>
>   common/Makefile               |  1 +
>   common/usb_onboard_hub.c      | 62 +++++++++++++++++++++++++++++++++++
>   drivers/usb/Kconfig           | 10 ++++++
>   drivers/usb/host/usb-uclass.c | 16 +++++----
>   4 files changed, 83 insertions(+), 6 deletions(-)
>   create mode 100644 common/usb_onboard_hub.c
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
