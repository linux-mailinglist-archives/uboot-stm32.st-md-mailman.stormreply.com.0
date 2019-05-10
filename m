Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DABE91B089
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 May 2019 09:00:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1BABC06B71
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 May 2019 07:00:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9897AC7128B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 13:56:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4ADpGfd017986; Fri, 10 May 2019 15:56:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=gwc7hC+ghxjt/1xbTQYn3xN5UkSHf5tLocsrpfA7/Sw=;
 b=luFG1WYuNsT+py1b/eeScMByX/3MK62DmDR1E9LsMwcaskuiDjtLqrCQFmD+UOJuQHGm
 KZr/rvGCNTHLPjofrG4eadNe73+FDNcf6wkpE9suX79ULPKomkWVBIpPbGj7wysh42jN
 QPM5/6NHvHLWyEAiaMk4gjy6XD4VYTZ0JIIWbttzctnsgPw+lLXsFB+QFC4EBAV2TDlU
 oJWGRoJMF5QrqHLhtBDNe+jSPtYgFoXKxz7R0EB6Xr5rYHYP0UIzLjy40OxTizqZAoH7
 ZQ2XbSGD1LEPJk89GTGJEmBBE2YuyPnd7KLLkHsNJ0pXuweLZoeYdFwSzkZOZ228kfSa UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2s1ut-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 15:56:00 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F62B31;
 Fri, 10 May 2019 13:55:58 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14B3C29E9;
 Fri, 10 May 2019 13:55:58 +0000 (GMT)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 May
 2019 15:55:57 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1347.000; Fri, 10 May 2019 15:55:57 +0200
From: Christophe ROULLIER <christophe.roullier@st.com>
To: "joe.hershberger@ni.com" <joe.hershberger@ni.com>
Thread-Topic: [U-Boot] [PATCH 2/5] net: dwc_eth_qos: add Ethernet stm32mp1
 support
Thread-Index: AQHU/BjH2XUez8J49kaBCxY/RRFmoaZjPJSAgAEZ4oA=
Date: Fri, 10 May 2019 13:55:57 +0000
Message-ID: <90190c83-f1be-21f8-4457-866aabb56f1e@st.com>
References: <20190426101339.25442-1-christophe.roullier@st.com>
 <20190426101339.25442-3-christophe.roullier@st.com>
 <CANr=Z=YtH6wPuWvsZ8SyiCFb3ouUKFpmH2YJsWagouMACTGdMw@mail.gmail.com>
In-Reply-To: <CANr=Z=YtH6wPuWvsZ8SyiCFb3ouUKFpmH2YJsWagouMACTGdMw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <503B49107F5CC54EB52542C0E24BAF66@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Mailman-Approved-At: Mon, 13 May 2019 07:00:03 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot <u-boot@lists.denx.de>, Joseph Hershberger <joseph.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 2/5] net: dwc_eth_qos: add
 Ethernet stm32mp1 support
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

Hi Joe,

On 09/05/2019 23:07, Joe Hershberger wrote:
> On Fri, Apr 26, 2019 at 6:16 AM Christophe Roullier
> <christophe.roullier@st.com>  wrote:
>> Synopsys GMAC 4.20 is used. And Phy mode for eval and disco is RMII
>> with PHY Realtek RTL8211 (RGMII)
>> We also support some other PHY config on stm32mp157c
>> PHY_MODE        (MII,GMII, RMII, RGMII) and in normal,
>> PHY wo crystal (25Mhz and 50Mhz), No 125Mhz from PHY config
> Can you split this into separate logical patches?

If it is possible, I would like to keep this in same patch.

Because the choice to select phy-mode and with or without crystal is 
only in eqos_probe_resources_stm32 and it is managed by DT properties.

Thanks in advance.

Christophe

> Thanks,
> -Joe
>
>> Signed-off-by: Christophe Roullier<christophe.roullier@st.com>
>> ---
>>
>>   drivers/net/dwc_eth_qos.c | 435 +++++++++++++++++++++++++++++++++-----
>>   1 file changed, 383 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
>> index 9f1c5af46e9..a6546d5e5ce 100644
>> --- a/drivers/net/dwc_eth_qos.c
>> +++ b/drivers/net/dwc_eth_qos.c
>> @@ -26,7 +26,6 @@
>>    *    supports a single RGMII PHY. This configuration also has SW control over
>>    *    all clock and reset signals to the HW block.
>>    */
>> -
>>   #include <common.h>
>>   #include <clk.h>
>>   #include <dm.h>
>> @@ -95,6 +94,7 @@ struct eqos_mac_regs {
>>   #define EQOS_MAC_RXQ_CTRL0_RXQ0EN_MASK                 3
>>   #define EQOS_MAC_RXQ_CTRL0_RXQ0EN_NOT_ENABLED          0
>>   #define EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_DCB          2
>> +#define EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_AV           1
>>
>>   #define EQOS_MAC_RXQ_CTRL2_PSRQ0_SHIFT                 0
>>   #define EQOS_MAC_RXQ_CTRL2_PSRQ0_MASK                  0xff
>> @@ -108,6 +108,7 @@ struct eqos_mac_regs {
>>   #define EQOS_MAC_MDIO_ADDRESS_RDA_SHIFT                        16
>>   #define EQOS_MAC_MDIO_ADDRESS_CR_SHIFT                 8
>>   #define EQOS_MAC_MDIO_ADDRESS_CR_20_35                 2
>> +#define EQOS_MAC_MDIO_ADDRESS_CR_250_300               5
>>   #define EQOS_MAC_MDIO_ADDRESS_SKAP                     BIT(4)
>>   #define EQOS_MAC_MDIO_ADDRESS_GOC_SHIFT                        2
>>   #define EQOS_MAC_MDIO_ADDRESS_GOC_READ                 3
>> @@ -260,6 +261,29 @@ struct eqos_desc {
>>
>>   struct eqos_config {
>>          bool reg_access_always_ok;
>> +       int mdio_wait;
>> +       int swr_wait;
>> +       int config_mac;
>> +       int config_mac_mdio;
>> +       int (*interface)(struct udevice *dev);
>> +       struct eqos_ops *ops;
>> +};
>> +
>> +struct eqos_ops {
>> +       void (*eqos_inval_desc)(void *desc);
>> +       void (*eqos_flush_desc)(void *desc);
>> +       void (*eqos_inval_buffer)(void *buf, size_t size);
>> +       void (*eqos_flush_buffer)(void *buf, size_t size);
>> +       int (*eqos_probe_resources)(struct udevice *dev);
>> +       int (*eqos_remove_resources)(struct udevice *dev);
>> +       int (*eqos_stop_resets)(struct udevice *dev);
>> +       int (*eqos_start_resets)(struct udevice *dev);
>> +       void (*eqos_stop_clks)(struct udevice *dev);
>> +       int (*eqos_start_clks)(struct udevice *dev);
>> +       int (*eqos_calibrate_pads)(struct udevice *dev);
>> +       int (*eqos_disable_calibration)(struct udevice *dev);
>> +       int (*eqos_set_tx_clk_speed)(struct udevice *dev);
>> +       ulong (*eqos_get_tick_clk_rate)(struct udevice *dev);
>>   };
>>
>>   struct eqos_priv {
>> @@ -276,6 +300,7 @@ struct eqos_priv {
>>          struct clk clk_rx;
>>          struct clk clk_ptp_ref;
>>          struct clk clk_tx;
>> +       struct clk clk_ck;
>>          struct clk clk_slave_bus;
>>          struct mii_dev *mii;
>>          struct phy_device *phy;
>> @@ -327,7 +352,7 @@ static void eqos_free_descs(void *descs)
>>   #endif
>>   }
>>
>> -static void eqos_inval_desc(void *desc)
>> +static void eqos_inval_desc_tegra186(void *desc)
>>   {
>>   #ifndef CONFIG_SYS_NONCACHED_MEMORY
>>          unsigned long start = (unsigned long)desc & ~(ARCH_DMA_MINALIGN - 1);
>> @@ -338,14 +363,36 @@ static void eqos_inval_desc(void *desc)
>>   #endif
>>   }
>>
>> -static void eqos_flush_desc(void *desc)
>> +static void eqos_inval_desc_stm32(void *desc)
>> +{
>> +#ifndef CONFIG_SYS_NONCACHED_MEMORY
>> +       unsigned long start = rounddown((unsigned long)desc, ARCH_DMA_MINALIGN);
>> +       unsigned long end = roundup((unsigned long)desc + EQOS_DESCRIPTOR_SIZE,
>> +                                   ARCH_DMA_MINALIGN);
>> +
>> +       invalidate_dcache_range(start, end);
>> +#endif
>> +}
>> +
>> +static void eqos_flush_desc_tegra186(void *desc)
>>   {
>>   #ifndef CONFIG_SYS_NONCACHED_MEMORY
>>          flush_cache((unsigned long)desc, EQOS_DESCRIPTOR_SIZE);
>>   #endif
>>   }
>>
>> -static void eqos_inval_buffer(void *buf, size_t size)
>> +static void eqos_flush_desc_stm32(void *desc)
>> +{
>> +#ifndef CONFIG_SYS_NONCACHED_MEMORY
>> +       unsigned long start = rounddown((unsigned long)desc, ARCH_DMA_MINALIGN);
>> +       unsigned long end = roundup((unsigned long)desc + EQOS_DESCRIPTOR_SIZE,
>> +                                   ARCH_DMA_MINALIGN);
>> +
>> +       flush_dcache_range(start, end);
>> +#endif
>> +}
>> +
>> +static void eqos_inval_buffer_tegra186(void *buf, size_t size)
>>   {
>>          unsigned long start = (unsigned long)buf & ~(ARCH_DMA_MINALIGN - 1);
>>          unsigned long end = ALIGN(start + size, ARCH_DMA_MINALIGN);
>> @@ -353,11 +400,29 @@ static void eqos_inval_buffer(void *buf, size_t size)
>>          invalidate_dcache_range(start, end);
>>   }
>>
>> -static void eqos_flush_buffer(void *buf, size_t size)
>> +static void eqos_inval_buffer_stm32(void *buf, size_t size)
>> +{
>> +       unsigned long start = rounddown((unsigned long)buf, ARCH_DMA_MINALIGN);
>> +       unsigned long end = roundup((unsigned long)buf + size,
>> +                                   ARCH_DMA_MINALIGN);
>> +
>> +       invalidate_dcache_range(start, end);
>> +}
>> +
>> +static void eqos_flush_buffer_tegra186(void *buf, size_t size)
>>   {
>>          flush_cache((unsigned long)buf, size);
>>   }
>>
>> +static void eqos_flush_buffer_stm32(void *buf, size_t size)
>> +{
>> +       unsigned long start = rounddown((unsigned long)buf, ARCH_DMA_MINALIGN);
>> +       unsigned long end = roundup((unsigned long)buf + size,
>> +                                   ARCH_DMA_MINALIGN);
>> +
>> +       flush_dcache_range(start, end);
>> +}
>> +
>>   static int eqos_mdio_wait_idle(struct eqos_priv *eqos)
>>   {
>>          return wait_for_bit_le32(&eqos->mac_regs->mdio_address,
>> @@ -386,14 +451,14 @@ static int eqos_mdio_read(struct mii_dev *bus, int mdio_addr, int mdio_devad,
>>                  EQOS_MAC_MDIO_ADDRESS_C45E;
>>          val |= (mdio_addr << EQOS_MAC_MDIO_ADDRESS_PA_SHIFT) |
>>                  (mdio_reg << EQOS_MAC_MDIO_ADDRESS_RDA_SHIFT) |
>> -               (EQOS_MAC_MDIO_ADDRESS_CR_20_35 <<
>> +               (eqos->config->config_mac_mdio <<
>>                   EQOS_MAC_MDIO_ADDRESS_CR_SHIFT) |
>>                  (EQOS_MAC_MDIO_ADDRESS_GOC_READ <<
>>                   EQOS_MAC_MDIO_ADDRESS_GOC_SHIFT) |
>>                  EQOS_MAC_MDIO_ADDRESS_GB;
>>          writel(val, &eqos->mac_regs->mdio_address);
>>
>> -       udelay(10);
>> +       udelay(eqos->config->mdio_wait);
>>
>>          ret = eqos_mdio_wait_idle(eqos);
>>          if (ret) {
>> @@ -432,14 +497,14 @@ static int eqos_mdio_write(struct mii_dev *bus, int mdio_addr, int mdio_devad,
>>                  EQOS_MAC_MDIO_ADDRESS_C45E;
>>          val |= (mdio_addr << EQOS_MAC_MDIO_ADDRESS_PA_SHIFT) |
>>                  (mdio_reg << EQOS_MAC_MDIO_ADDRESS_RDA_SHIFT) |
>> -               (EQOS_MAC_MDIO_ADDRESS_CR_20_35 <<
>> +               (eqos->config->config_mac_mdio <<
>>                   EQOS_MAC_MDIO_ADDRESS_CR_SHIFT) |
>>                  (EQOS_MAC_MDIO_ADDRESS_GOC_WRITE <<
>>                   EQOS_MAC_MDIO_ADDRESS_GOC_SHIFT) |
>>                  EQOS_MAC_MDIO_ADDRESS_GB;
>>          writel(val, &eqos->mac_regs->mdio_address);
>>
>> -       udelay(10);
>> +       udelay(eqos->config->mdio_wait);
>>
>>          ret = eqos_mdio_wait_idle(eqos);
>>          if (ret) {
>> @@ -509,6 +574,53 @@ err:
>>          return ret;
>>   }
>>
>> +static int eqos_start_clks_stm32(struct udevice *dev)
>> +{
>> +       struct eqos_priv *eqos = dev_get_priv(dev);
>> +       int ret;
>> +
>> +       debug("%s(dev=%p):\n", __func__, dev);
>> +
>> +       ret = clk_enable(&eqos->clk_master_bus);
>> +       if (ret < 0) {
>> +               pr_err("clk_enable(clk_master_bus) failed: %d", ret);
>> +               goto err;
>> +       }
>> +
>> +       ret = clk_enable(&eqos->clk_rx);
>> +       if (ret < 0) {
>> +               pr_err("clk_enable(clk_rx) failed: %d", ret);
>> +               goto err_disable_clk_master_bus;
>> +       }
>> +
>> +       ret = clk_enable(&eqos->clk_tx);
>> +       if (ret < 0) {
>> +               pr_err("clk_enable(clk_tx) failed: %d", ret);
>> +               goto err_disable_clk_rx;
>> +       }
>> +
>> +       if (clk_valid(&eqos->clk_ck)) {
>> +               ret = clk_enable(&eqos->clk_ck);
>> +               if (ret < 0) {
>> +                       pr_err("clk_enable(clk_ck) failed: %d", ret);
>> +                       goto err_disable_clk_tx;
>> +               }
>> +       }
>> +
>> +       debug("%s: OK\n", __func__);
>> +       return 0;
>> +
>> +err_disable_clk_tx:
>> +       clk_disable(&eqos->clk_tx);
>> +err_disable_clk_rx:
>> +       clk_disable(&eqos->clk_rx);
>> +err_disable_clk_master_bus:
>> +       clk_disable(&eqos->clk_master_bus);
>> +err:
>> +       debug("%s: FAILED: %d\n", __func__, ret);
>> +       return ret;
>> +}
>> +
>>   void eqos_stop_clks_tegra186(struct udevice *dev)
>>   {
>>          struct eqos_priv *eqos = dev_get_priv(dev);
>> @@ -524,6 +636,21 @@ void eqos_stop_clks_tegra186(struct udevice *dev)
>>          debug("%s: OK\n", __func__);
>>   }
>>
>> +void eqos_stop_clks_stm32(struct udevice *dev)
>> +{
>> +       struct eqos_priv *eqos = dev_get_priv(dev);
>> +
>> +       debug("%s(dev=%p):\n", __func__, dev);
>> +
>> +       clk_disable(&eqos->clk_tx);
>> +       clk_disable(&eqos->clk_rx);
>> +       clk_disable(&eqos->clk_master_bus);
>> +       if (clk_valid(&eqos->clk_ck))
>> +               clk_disable(&eqos->clk_ck);
>> +
>> +       debug("%s: OK\n", __func__);
>> +}
>> +
>>   static int eqos_start_resets_tegra186(struct udevice *dev)
>>   {
>>          struct eqos_priv *eqos = dev_get_priv(dev);
>> @@ -563,6 +690,11 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
>>          return 0;
>>   }
>>
>> +static int eqos_start_resets_stm32(struct udevice *dev)
>> +{
>> +       return 0;
>> +}
>> +
>>   static int eqos_stop_resets_tegra186(struct udevice *dev)
>>   {
>>          struct eqos_priv *eqos = dev_get_priv(dev);
>> @@ -573,6 +705,11 @@ static int eqos_stop_resets_tegra186(struct udevice *dev)
>>          return 0;
>>   }
>>
>> +static int eqos_stop_resets_stm32(struct udevice *dev)
>> +{
>> +       return 0;
>> +}
>> +
>>   static int eqos_calibrate_pads_tegra186(struct udevice *dev)
>>   {
>>          struct eqos_priv *eqos = dev_get_priv(dev);
>> @@ -632,6 +769,23 @@ static ulong eqos_get_tick_clk_rate_tegra186(struct udevice *dev)
>>          return clk_get_rate(&eqos->clk_slave_bus);
>>   }
>>
>> +static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)
>> +{
>> +       struct eqos_priv *eqos = dev_get_priv(dev);
>> +
>> +       return clk_get_rate(&eqos->clk_master_bus);
>> +}
>> +
>> +static int eqos_calibrate_pads_stm32(struct udevice *dev)
>> +{
>> +       return 0;
>> +}
>> +
>> +static int eqos_disable_calibration_stm32(struct udevice *dev)
>> +{
>> +       return 0;
>> +}
>> +
>>   static int eqos_set_full_duplex(struct udevice *dev)
>>   {
>>          struct eqos_priv *eqos = dev_get_priv(dev);
>> @@ -726,6 +880,11 @@ static int eqos_set_tx_clk_speed_tegra186(struct udevice *dev)
>>          return 0;
>>   }
>>
>> +static int eqos_set_tx_clk_speed_stm32(struct udevice *dev)
>> +{
>> +       return 0;
>> +}
>> +
>>   static int eqos_adjust_link(struct udevice *dev)
>>   {
>>          struct eqos_priv *eqos = dev_get_priv(dev);
>> @@ -766,23 +925,23 @@ static int eqos_adjust_link(struct udevice *dev)
>>          }
>>
>>          if (en_calibration) {
>> -               ret = eqos_calibrate_pads_tegra186(dev);
>> +               ret = eqos->config->ops->eqos_calibrate_pads(dev);
>>                  if (ret < 0) {
>> -                       pr_err("eqos_calibrate_pads_tegra186() failed: %d", ret);
>> +                       pr_err("eqos_calibrate_pads() failed: %d",
>> +                              ret);
>>                          return ret;
>>                  }
>>          } else {
>> -               ret = eqos_disable_calibration_tegra186(dev);
>> +               ret = eqos->config->ops->eqos_disable_calibration(dev);
>>                  if (ret < 0) {
>> -                       pr_err("eqos_disable_calibration_tegra186() failed: %d",
>> -                             ret);
>> +                       pr_err("eqos_disable_calibration() failed: %d",
>> +                              ret);
>>                          return ret;
>>                  }
>>          }
>> -
>> -       ret = eqos_set_tx_clk_speed_tegra186(dev);
>> +       ret = eqos->config->ops->eqos_set_tx_clk_speed(dev);
>>          if (ret < 0) {
>> -               pr_err("eqos_set_tx_clk_speed_tegra186() failed: %d", ret);
>> +               pr_err("eqos_set_tx_clk_speed() failed: %d", ret);
>>                  return ret;
>>          }
>>
>> @@ -846,15 +1005,15 @@ static int eqos_start(struct udevice *dev)
>>          eqos->tx_desc_idx = 0;
>>          eqos->rx_desc_idx = 0;
>>
>> -       ret = eqos_start_clks_tegra186(dev);
>> +       ret = eqos->config->ops->eqos_start_clks(dev);
>>          if (ret < 0) {
>> -               pr_err("eqos_start_clks_tegra186() failed: %d", ret);
>> +               pr_err("eqos_start_clks() failed: %d", ret);
>>                  goto err;
>>          }
>>
>> -       ret = eqos_start_resets_tegra186(dev);
>> +       ret = eqos->config->ops->eqos_start_resets(dev);
>>          if (ret < 0) {
>> -               pr_err("eqos_start_resets_tegra186() failed: %d", ret);
>> +               pr_err("eqos_start_resets() failed: %d", ret);
>>                  goto err_stop_clks;
>>          }
>>
>> @@ -863,32 +1022,41 @@ static int eqos_start(struct udevice *dev)
>>          eqos->reg_access_ok = true;
>>
>>          ret = wait_for_bit_le32(&eqos->dma_regs->mode,
>> -                               EQOS_DMA_MODE_SWR, false, 10, false);
>> +                               EQOS_DMA_MODE_SWR, false,
>> +                               eqos->config->swr_wait, false);
>>          if (ret) {
>>                  pr_err("EQOS_DMA_MODE_SWR stuck");
>>                  goto err_stop_resets;
>>          }
>>
>> -       ret = eqos_calibrate_pads_tegra186(dev);
>> +       ret = eqos->config->ops->eqos_calibrate_pads(dev);
>>          if (ret < 0) {
>> -               pr_err("eqos_calibrate_pads_tegra186() failed: %d", ret);
>> +               pr_err("eqos_calibrate_pads() failed: %d", ret);
>>                  goto err_stop_resets;
>>          }
>> +       rate = eqos->config->ops->eqos_get_tick_clk_rate(dev);
>>
>> -       rate = eqos_get_tick_clk_rate_tegra186(dev);
>>          val = (rate / 1000000) - 1;
>>          writel(val, &eqos->mac_regs->us_tic_counter);
>>
>> -       eqos->phy = phy_connect(eqos->mii, 0, dev, 0);
>> +       /*
>> +        * if PHY was already connected and configured,
>> +        * don't need to reconnect/reconfigure again
>> +        */
>>          if (!eqos->phy) {
>> -               pr_err("phy_connect() failed");
>> -               goto err_stop_resets;
>> -       }
>> -       ret = phy_config(eqos->phy);
>> -       if (ret < 0) {
>> -               pr_err("phy_config() failed: %d", ret);
>> -               goto err_shutdown_phy;
>> +               eqos->phy = phy_connect(eqos->mii, 0, dev,
>> +                                       eqos->config->interface(dev));
>> +               if (!eqos->phy) {
>> +                       pr_err("phy_connect() failed");
>> +                       goto err_stop_resets;
>> +               }
>> +               ret = phy_config(eqos->phy);
>> +               if (ret < 0) {
>> +                       pr_err("phy_config() failed: %d", ret);
>> +                       goto err_shutdown_phy;
>> +               }
>>          }
>> +
>>          ret = phy_startup(eqos->phy);
>>          if (ret < 0) {
>>                  pr_err("phy_startup() failed: %d", ret);
>> @@ -993,7 +1161,7 @@ static int eqos_start(struct udevice *dev)
>>          clrsetbits_le32(&eqos->mac_regs->rxq_ctrl0,
>>                          EQOS_MAC_RXQ_CTRL0_RXQ0EN_MASK <<
>>                          EQOS_MAC_RXQ_CTRL0_RXQ0EN_SHIFT,
>> -                       EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_DCB <<
>> +                       eqos->config->config_mac <<
>>                          EQOS_MAC_RXQ_CTRL0_RXQ0EN_SHIFT);
>>
>>          /* Set TX flow control parameters */
>> @@ -1074,7 +1242,7 @@ static int eqos_start(struct udevice *dev)
>>                                               (i * EQOS_MAX_PACKET_SIZE));
>>                  rx_desc->des3 |= EQOS_DESC3_OWN | EQOS_DESC3_BUF1V;
>>          }
>> -       flush_cache((unsigned long)eqos->descs, EQOS_DESCRIPTORS_SIZE);
>> +       eqos->config->ops->eqos_flush_desc(eqos->descs);
>>
>>          writel(0, &eqos->dma_regs->ch0_txdesc_list_haddress);
>>          writel((ulong)eqos->tx_descs, &eqos->dma_regs->ch0_txdesc_list_address);
>> @@ -1113,11 +1281,10 @@ static int eqos_start(struct udevice *dev)
>>
>>   err_shutdown_phy:
>>          phy_shutdown(eqos->phy);
>> -       eqos->phy = NULL;
>>   err_stop_resets:
>> -       eqos_stop_resets_tegra186(dev);
>> +       eqos->config->ops->eqos_stop_resets(dev);
>>   err_stop_clks:
>> -       eqos_stop_clks_tegra186(dev);
>> +       eqos->config->ops->eqos_stop_clks(dev);
>>   err:
>>          pr_err("FAILED: %d", ret);
>>          return ret;
>> @@ -1170,10 +1337,9 @@ void eqos_stop(struct udevice *dev)
>>
>>          if (eqos->phy) {
>>                  phy_shutdown(eqos->phy);
>> -               eqos->phy = NULL;
>>          }
>> -       eqos_stop_resets_tegra186(dev);
>> -       eqos_stop_clks_tegra186(dev);
>> +       eqos->config->ops->eqos_stop_resets(dev);
>> +       eqos->config->ops->eqos_stop_clks(dev);
>>
>>          debug("%s: OK\n", __func__);
>>   }
>> @@ -1188,7 +1354,7 @@ int eqos_send(struct udevice *dev, void *packet, int length)
>>                length);
>>
>>          memcpy(eqos->tx_dma_buf, packet, length);
>> -       eqos_flush_buffer(eqos->tx_dma_buf, length);
>> +       eqos->config->ops->eqos_flush_buffer(eqos->tx_dma_buf, length);
>>
>>          tx_desc = &(eqos->tx_descs[eqos->tx_desc_idx]);
>>          eqos->tx_desc_idx++;
>> @@ -1203,12 +1369,12 @@ int eqos_send(struct udevice *dev, void *packet, int length)
>>           */
>>          mb();
>>          tx_desc->des3 = EQOS_DESC3_OWN | EQOS_DESC3_FD | EQOS_DESC3_LD | length;
>> -       eqos_flush_desc(tx_desc);
>> +       eqos->config->ops->eqos_flush_desc(tx_desc);
>>
>>          writel((ulong)(tx_desc + 1), &eqos->dma_regs->ch0_txdesc_tail_pointer);
>>
>>          for (i = 0; i < 1000000; i++) {
>> -               eqos_inval_desc(tx_desc);
>> +               eqos->config->ops->eqos_inval_desc(tx_desc);
>>                  if (!(readl(&tx_desc->des3) & EQOS_DESC3_OWN))
>>                          return 0;
>>                  udelay(1);
>> @@ -1238,7 +1404,7 @@ int eqos_recv(struct udevice *dev, int flags, uchar **packetp)
>>          length = rx_desc->des3 & 0x7fff;
>>          debug("%s: *packetp=%p, length=%d\n", __func__, *packetp, length);
>>
>> -       eqos_inval_buffer(*packetp, length);
>> +       eqos->config->ops->eqos_inval_buffer(*packetp, length);
>>
>>          return length;
>>   }
>> @@ -1269,7 +1435,7 @@ int eqos_free_pkt(struct udevice *dev, uchar *packet, int length)
>>           */
>>          mb();
>>          rx_desc->des3 |= EQOS_DESC3_OWN | EQOS_DESC3_BUF1V;
>> -       eqos_flush_desc(rx_desc);
>> +       eqos->config->ops->eqos_flush_desc(rx_desc);
>>
>>          writel((ulong)rx_desc, &eqos->dma_regs->ch0_rxdesc_tail_pointer);
>>
>> @@ -1304,7 +1470,7 @@ static int eqos_probe_resources_core(struct udevice *dev)
>>                  ret = -ENOMEM;
>>                  goto err_free_descs;
>>          }
>> -       debug("%s: rx_dma_buf=%p\n", __func__, eqos->rx_dma_buf);
>> +       debug("%s: tx_dma_buf=%p\n", __func__, eqos->tx_dma_buf);
>>
>>          eqos->rx_dma_buf = memalign(EQOS_BUFFER_ALIGN, EQOS_RX_BUFFER_SIZE);
>>          if (!eqos->rx_dma_buf) {
>> @@ -1312,7 +1478,7 @@ static int eqos_probe_resources_core(struct udevice *dev)
>>                  ret = -ENOMEM;
>>                  goto err_free_tx_dma_buf;
>>          }
>> -       debug("%s: tx_dma_buf=%p\n", __func__, eqos->tx_dma_buf);
>> +       debug("%s: rx_dma_buf=%p\n", __func__, eqos->rx_dma_buf);
>>
>>          eqos->rx_pkt = malloc(EQOS_MAX_PACKET_SIZE);
>>          if (!eqos->rx_pkt) {
>> @@ -1424,6 +1590,98 @@ err_free_reset_eqos:
>>          return ret;
>>   }
>>
>> +/* board-specific Ethernet Interface initializations. */
>> +__weak int board_interface_eth_init(int interface_type, bool eth_clk_sel_reg,
>> +                                   bool eth_ref_clk_sel_reg)
>> +{
>> +       return 0;
>> +}
>> +
>> +static int eqos_probe_resources_stm32(struct udevice *dev)
>> +{
>> +       struct eqos_priv *eqos = dev_get_priv(dev);
>> +       int ret;
>> +       int interface;
>> +       bool eth_clk_sel_reg = false;
>> +       bool eth_ref_clk_sel_reg = false;
>> +
>> +       debug("%s(dev=%p):\n", __func__, dev);
>> +
>> +       interface = eqos->config->interface(dev);
>> +
>> +       if (interface == -1) {
>> +               pr_err("Invalid PHY interface\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       /* Gigabit Ethernet 125MHz clock selection. */
>> +       eth_clk_sel_reg = dev_read_bool(dev, "st,eth_clk_sel");
>> +
>> +       /* Ethernet 50Mhz RMII clock selection */
>> +       eth_ref_clk_sel_reg =
>> +               dev_read_bool(dev, "st,eth_ref_clk_sel");
>> +
>> +       ret = board_interface_eth_init(interface, eth_clk_sel_reg,
>> +                                      eth_ref_clk_sel_reg);
>> +       if (ret)
>> +               return -EINVAL;
>> +
>> +       ret = clk_get_by_name(dev, "stmmaceth", &eqos->clk_master_bus);
>> +       if (ret) {
>> +               pr_err("clk_get_by_name(master_bus) failed: %d", ret);
>> +               goto err_probe;
>> +       }
>> +
>> +       ret = clk_get_by_name(dev, "mac-clk-rx", &eqos->clk_rx);
>> +       if (ret) {
>> +               pr_err("clk_get_by_name(rx) failed: %d", ret);
>> +               goto err_free_clk_master_bus;
>> +       }
>> +
>> +       ret = clk_get_by_name(dev, "mac-clk-tx", &eqos->clk_tx);
>> +       if (ret) {
>> +               pr_err("clk_get_by_name(tx) failed: %d", ret);
>> +               goto err_free_clk_rx;
>> +       }
>> +
>> +       /*  Get ETH_CLK clocks (optional) */
>> +       ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
>> +       if (ret)
>> +               pr_warn("No phy clock provided %d", ret);
>> +
>> +       debug("%s: OK\n", __func__);
>> +       return 0;
>> +
>> +err_free_clk_rx:
>> +       clk_free(&eqos->clk_rx);
>> +err_free_clk_master_bus:
>> +       clk_free(&eqos->clk_master_bus);
>> +err_probe:
>> +
>> +       debug("%s: returns %d\n", __func__, ret);
>> +       return ret;
>> +}
>> +
>> +static int eqos_get_interface_stm32(struct udevice *dev)
>> +{
>> +       const char *phy_mode;
>> +       int interface = -1;
>> +
>> +       debug("%s(dev=%p):\n", __func__, dev);
>> +
>> +       phy_mode = fdt_getprop(gd->fdt_blob, dev_of_offset(dev), "phy-mode",
>> +                              NULL);
>> +       if (phy_mode)
>> +               interface = phy_get_interface_by_name(phy_mode);
>> +
>> +       return interface;
>> +}
>> +
>> +static int eqos_get_interface_tegra186(struct udevice *dev)
>> +{
>> +       return 0;
>> +}
>> +
>>   static int eqos_remove_resources_tegra186(struct udevice *dev)
>>   {
>>          struct eqos_priv *eqos = dev_get_priv(dev);
>> @@ -1442,6 +1700,22 @@ static int eqos_remove_resources_tegra186(struct udevice *dev)
>>          return 0;
>>   }
>>
>> +static int eqos_remove_resources_stm32(struct udevice *dev)
>> +{
>> +       struct eqos_priv *eqos = dev_get_priv(dev);
>> +
>> +       debug("%s(dev=%p):\n", __func__, dev);
>> +
>> +       clk_free(&eqos->clk_tx);
>> +       clk_free(&eqos->clk_rx);
>> +       clk_free(&eqos->clk_master_bus);
>> +       if (clk_valid(&eqos->clk_ck))
>> +               clk_free(&eqos->clk_ck);
>> +
>> +       debug("%s: OK\n", __func__);
>> +       return 0;
>> +}
>> +
>>   static int eqos_probe(struct udevice *dev)
>>   {
>>          struct eqos_priv *eqos = dev_get_priv(dev);
>> @@ -1468,15 +1742,16 @@ static int eqos_probe(struct udevice *dev)
>>                  return ret;
>>          }
>>
>> -       ret = eqos_probe_resources_tegra186(dev);
>> +       ret = eqos->config->ops->eqos_probe_resources(dev);
>>          if (ret < 0) {
>> -               pr_err("eqos_probe_resources_tegra186() failed: %d", ret);
>> +               pr_err("eqos_probe_resources() failed: %d", ret);
>>                  goto err_remove_resources_core;
>>          }
>>
>>          eqos->mii = mdio_alloc();
>>          if (!eqos->mii) {
>>                  pr_err("mdio_alloc() failed");
>> +               ret = -ENOMEM;
>>                  goto err_remove_resources_tegra;
>>          }
>>          eqos->mii->read = eqos_mdio_read;
>> @@ -1496,7 +1771,7 @@ static int eqos_probe(struct udevice *dev)
>>   err_free_mdio:
>>          mdio_free(eqos->mii);
>>   err_remove_resources_tegra:
>> -       eqos_remove_resources_tegra186(dev);
>> +       eqos->config->ops->eqos_remove_resources(dev);
>>   err_remove_resources_core:
>>          eqos_remove_resources_core(dev);
>>
>> @@ -1512,7 +1787,8 @@ static int eqos_remove(struct udevice *dev)
>>
>>          mdio_unregister(eqos->mii);
>>          mdio_free(eqos->mii);
>> -       eqos_remove_resources_tegra186(dev);
>> +       eqos->config->ops->eqos_remove_resources(dev);
>> +
>>          eqos_probe_resources_core(dev);
>>
>>          debug("%s: OK\n", __func__);
>> @@ -1528,8 +1804,58 @@ static const struct eth_ops eqos_ops = {
>>          .write_hwaddr = eqos_write_hwaddr,
>>   };
>>
>> +static struct eqos_ops eqos_tegra186_ops = {
>> +       .eqos_inval_desc = eqos_inval_desc_tegra186,
>> +       .eqos_flush_desc = eqos_flush_desc_tegra186,
>> +       .eqos_inval_buffer = eqos_inval_buffer_tegra186,
>> +       .eqos_flush_buffer = eqos_flush_buffer_tegra186,
>> +       .eqos_probe_resources = eqos_probe_resources_tegra186,
>> +       .eqos_remove_resources = eqos_remove_resources_tegra186,
>> +       .eqos_stop_resets = eqos_stop_resets_tegra186,
>> +       .eqos_start_resets = eqos_start_resets_tegra186,
>> +       .eqos_stop_clks = eqos_stop_clks_tegra186,
>> +       .eqos_start_clks = eqos_start_clks_tegra186,
>> +       .eqos_calibrate_pads = eqos_calibrate_pads_tegra186,
>> +       .eqos_disable_calibration = eqos_disable_calibration_tegra186,
>> +       .eqos_set_tx_clk_speed = eqos_set_tx_clk_speed_tegra186,
>> +       .eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_tegra186
>> +};
>> +
>>   static const struct eqos_config eqos_tegra186_config = {
>>          .reg_access_always_ok = false,
>> +       .mdio_wait = 10,
>> +       .swr_wait = 10,
>> +       .config_mac = EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_DCB,
>> +       .config_mac_mdio = EQOS_MAC_MDIO_ADDRESS_CR_20_35,
>> +       .interface = eqos_get_interface_tegra186,
>> +       .ops = &eqos_tegra186_ops
>> +};
>> +
>> +static struct eqos_ops eqos_stm32_ops = {
>> +       .eqos_inval_desc = eqos_inval_desc_stm32,
>> +       .eqos_flush_desc = eqos_flush_desc_stm32,
>> +       .eqos_inval_buffer = eqos_inval_buffer_stm32,
>> +       .eqos_flush_buffer = eqos_flush_buffer_stm32,
>> +       .eqos_probe_resources = eqos_probe_resources_stm32,
>> +       .eqos_remove_resources = eqos_remove_resources_stm32,
>> +       .eqos_stop_resets = eqos_stop_resets_stm32,
>> +       .eqos_start_resets = eqos_start_resets_stm32,
>> +       .eqos_stop_clks = eqos_stop_clks_stm32,
>> +       .eqos_start_clks = eqos_start_clks_stm32,
>> +       .eqos_calibrate_pads = eqos_calibrate_pads_stm32,
>> +       .eqos_disable_calibration = eqos_disable_calibration_stm32,
>> +       .eqos_set_tx_clk_speed = eqos_set_tx_clk_speed_stm32,
>> +       .eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32
>> +};
>> +
>> +static const struct eqos_config eqos_stm32_config = {
>> +       .reg_access_always_ok = false,
>> +       .mdio_wait = 10000,
>> +       .swr_wait = 50,
>> +       .config_mac = EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_AV,
>> +       .config_mac_mdio = EQOS_MAC_MDIO_ADDRESS_CR_250_300,
>> +       .interface = eqos_get_interface_stm32,
>> +       .ops = &eqos_stm32_ops
>>   };
>>
>>   static const struct udevice_id eqos_ids[] = {
>> @@ -1537,6 +1863,11 @@ static const struct udevice_id eqos_ids[] = {
>>                  .compatible = "nvidia,tegra186-eqos",
>>                  .data = (ulong)&eqos_tegra186_config
>>          },
>> +       {
>> +               .compatible = "snps,dwmac-4.20a",
>> +               .data = (ulong)&eqos_stm32_config
>> +       },
>> +
>>          { }
>>   };
>>
>> --
>> 2.17.1
>>
>> _______________________________________________
>> U-Boot mailing list
>> U-Boot@lists.denx.de
>> https://lists.denx.de/listinfo/u-boot
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
