Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D631A9437
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2020 09:27:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E9E6C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2020 07:27:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5B0EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 07:27:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03F7I35x002243; Wed, 15 Apr 2020 09:27:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=OvR98SnUx88k++rWebBZkNhXOKntTtkr03GjbicLNGQ=;
 b=bmBxFyhvdsrGsdYHh2Qo9l1Pfdugu2/lyfBZ6AzaKB8myq9JDDdVenO2OU11Ty6szgdV
 5YSVJz9cAKAkU1JHfafdRLqRo6xtQa6RJV5GjsQw47Ysw2niGwesMjJRcKFOEbqjfYkV
 oyrufpEGOshrjehRsWjmI+WyL4jq1LwEW4BUQfUUknIy0T856mmUO9vCV4BmRzbnFnwT
 upAVcN6xqWsH31R3N4vaArthMvrsnzrn/VQT6sWo2pjAjK1ZKOxM+iGejoXlMcHIdj+U
 lak5cjcosmRmHsWjHB1wovVw6OrXY8yH5FNDOXtF8VOhdRaLImafNswswVGWDw+dD/+Y WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn94a3gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Apr 2020 09:27:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D1AF10002A;
 Wed, 15 Apr 2020 09:27:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2B1A2A4D8B;
 Wed, 15 Apr 2020 09:27:32 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 09:27:32 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 15 Apr 2020 09:27:32 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 1/2] net: dwc_eth_qos: implement
 reset-gpios for stm32
Thread-Index: AQHWEvdT4KYD1zs7F0++/iOc/QvguA==
Date: Wed, 15 Apr 2020 07:27:32 +0000
Message-ID: <0fde24eb-205d-c398-ae8a-cf441359da6b@st.com>
References: <20200318095016.19942-1-patrick.delaunay@st.com>
In-Reply-To: <20200318095016.19942-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <C52D7D0E5792AF4CB3EC698ED4B9A7B7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_01:2020-04-14,
 2020-04-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Christophe ROULLIER <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] net: dwc_eth_qos: implement
 reset-gpios for stm32
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

Hi

On 3/18/20 10:50 AM, Patrick Delaunay wrote:
> From: Christophe Roullier <christophe.roullier@st.com>
>
> Add management of property "reset-gpios" in the node identified by
> "phy-handle" to configure any GPIO used to reset the PHY.
>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> Reviewed-by: Patrice CHOTARD <patrice.chotard@st.com>
> Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/net/dwc_eth_qos.c | 53 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)

Applied to u-boot-stm/next

Thanks

Patrice


>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index 0564bebf76..4796659216 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -694,6 +694,29 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
>  
>  static int eqos_start_resets_stm32(struct udevice *dev)
>  {
> +	struct eqos_priv *eqos = dev_get_priv(dev);
> +	int ret;
> +
> +	debug("%s(dev=%p):\n", __func__, dev);
> +	if (dm_gpio_is_valid(&eqos->phy_reset_gpio)) {
> +		ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 1);
> +		if (ret < 0) {
> +			pr_err("dm_gpio_set_value(phy_reset, assert) failed: %d",
> +			       ret);
> +			return ret;
> +		}
> +
> +		udelay(2);
> +
> +		ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 0);
> +		if (ret < 0) {
> +			pr_err("dm_gpio_set_value(phy_reset, deassert) failed: %d",
> +			       ret);
> +			return ret;
> +		}
> +	}
> +	debug("%s: OK\n", __func__);
> +
>  	return 0;
>  }
>  
> @@ -709,6 +732,18 @@ static int eqos_stop_resets_tegra186(struct udevice *dev)
>  
>  static int eqos_stop_resets_stm32(struct udevice *dev)
>  {
> +	struct eqos_priv *eqos = dev_get_priv(dev);
> +	int ret;
> +
> +	if (dm_gpio_is_valid(&eqos->phy_reset_gpio)) {
> +		ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 1);
> +		if (ret < 0) {
> +			pr_err("dm_gpio_set_value(phy_reset, assert) failed: %d",
> +			       ret);
> +			return ret;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1604,6 +1639,7 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>  	struct eqos_priv *eqos = dev_get_priv(dev);
>  	int ret;
>  	phy_interface_t interface;
> +	struct ofnode_phandle_args phandle_args;
>  
>  	debug("%s(dev=%p):\n", __func__, dev);
>  
> @@ -1641,6 +1677,20 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>  	if (ret)
>  		pr_warn("No phy clock provided %d", ret);
>  
> +	ret = dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
> +					 &phandle_args);
> +	if (!ret) {
> +		/* search "reset-gpios" in phy node */
> +		ret = gpio_request_by_name_nodev(phandle_args.node,
> +						 "reset-gpios", 0,
> +						 &eqos->phy_reset_gpio,
> +						 GPIOD_IS_OUT |
> +						 GPIOD_IS_OUT_ACTIVE);
> +		if (ret)
> +			pr_warn("gpio_request_by_name(phy reset) not provided %d",
> +				ret);
> +	}
> +
>  	debug("%s: OK\n", __func__);
>  	return 0;
>  
> @@ -1704,6 +1754,9 @@ static int eqos_remove_resources_stm32(struct udevice *dev)
>  	if (clk_valid(&eqos->clk_ck))
>  		clk_free(&eqos->clk_ck);
>  
> +	if (dm_gpio_is_valid(&eqos->phy_reset_gpio))
> +		dm_gpio_free(dev, &eqos->phy_reset_gpio);
> +
>  	debug("%s: OK\n", __func__);
>  	return 0;
>  }
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
