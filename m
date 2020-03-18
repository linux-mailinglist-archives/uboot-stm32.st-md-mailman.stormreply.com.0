Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2956C189882
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:52:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D30EBC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:52:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD984C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:52:43 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9lWMl025069; Wed, 18 Mar 2020 10:52:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=7+Vsm8iDP+/5crWBa8GQUPLeOsZePdsn+zWO+nli6WM=;
 b=vMQMDp9RteqUJZ0MK0gPWXPt7myd3QEWQXlPl8ZhxTy7CjVHWhRwITowdD0vL5cJL/jT
 iL7yXiKZszqyw0LlfFjV7KnbS3Xu2MmO3ValmIxu72WwwoOzqWfc7XlNDHvoe5m9BDOM
 MaxsuT+mS/bGwkMtzDzBuOdEJZG9gLpm4xwqnKwhRp3dg60VMLxEhyx2kQL76TnqxCvV
 5alXXv9qyJFv8za5tKxCF1xhZyND8hcTlpsYYnNClS/fGc0X19EPtf54MVx/xmKJqHvV
 bjMdNW+v1BhgWcfmf4C1TrOp6Rqj6GsoKKahi21DxMUO7JxJokKByLoO0eGHO215U3YR Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8etaspw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:52:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B54E100034;
 Wed, 18 Mar 2020 10:52:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7FC5521FEB8;
 Wed, 18 Mar 2020 10:52:32 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 10:52:32 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 10:52:31 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 9/9] ram: stm32mp1: the property st,phy-cal becomes
 optional
Thread-Index: AQHV86AK5IMU9jGDJkaNEgGn6YXIw6hOHd6A
Date: Wed, 18 Mar 2020 09:52:31 +0000
Message-ID: <12e50cb0-d4e1-4496-4cef-b3609bee3cde@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306101412.15376-2-patrick.delaunay@st.com>
In-Reply-To: <20200306101412.15376-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <93222C808E3AB34B81665190177C80C3@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 9/9] ram: stm32mp1: the property st,
 phy-cal becomes optional
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


On 3/6/20 11:14 AM, Patrick Delaunay wrote:
> This parameter "st,phy-cal" becomes optional and when it is
> absent the built-in PHY calibration is done.
>
> It is the case in the helper dtsi file "stm32mp15-ddr.dtsi"
> except if DDR_PHY_CAL_SKIP is defined.
>
> This patch also impact the ddr interactive mode
> - the registers of the param 'phy.cal' are initialized to 0 when
>   "st,phy-cal" is not present in device tree (default behavior when
>   DDR_PHY_CAL_SKIP is not activated)
> - the info 'cal' field can be use to change the calibration behavior
>   - cal=1 => use param phy.cal to initialize the PHY, built-in training
>              is skipped
>   - cal=0 => param phy.cal is absent, built-in training is used (default)
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp15-ddr.dtsi               |  3 ++
>  .../memory-controllers/st,stm32mp1-ddr.txt    |  2 ++
>  drivers/ram/stm32mp1/stm32mp1_ddr.c           | 19 +++++++----
>  drivers/ram/stm32mp1/stm32mp1_ddr.h           |  1 +
>  drivers/ram/stm32mp1/stm32mp1_interactive.c   | 13 ++++++-
>  drivers/ram/stm32mp1/stm32mp1_ram.c           | 34 ++++++++++++++-----
>  6 files changed, 56 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15-ddr.dtsi b/arch/arm/dts/stm32mp15-ddr.dtsi
> index 38f29bb789..8b20b5e173 100644
> --- a/arch/arm/dts/stm32mp15-ddr.dtsi
> +++ b/arch/arm/dts/stm32mp15-ddr.dtsi
> @@ -133,6 +133,7 @@
>  				DDR_MR3
>  			>;
>  
> +#ifdef DDR_PHY_CAL_SKIP
>  			st,phy-cal = <
>  				DDR_DX0DLLCR
>  				DDR_DX0DQTR
> @@ -148,6 +149,8 @@
>  				DDR_DX3DQSTR
>  			>;
>  
> +#endif
> +
>  			status = "okay";
>  		};
>  	};
> diff --git a/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt b/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
> index ee708ce92c..ac6a7df432 100644
> --- a/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
> +++ b/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
> @@ -129,6 +129,8 @@ phyc attributes:
>  		MR3
>  
>  - st,phy-cal	: phy cal depending of calibration or tuning of DDR
> +	This parameter is optional; when it is absent the built-in PHY
> +	calibration is done.
>  	for STM32MP15x: 12 values are requested in this order
>  		DX0DLLCR
>  		DX0DQTR
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.c b/drivers/ram/stm32mp1/stm32mp1_ddr.c
> index b9300dd6d1..11b14ae652 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ddr.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_ddr.c
> @@ -769,7 +769,8 @@ start:
>   */
>  	set_reg(priv, REGPHY_REG, &config->p_reg);
>  	set_reg(priv, REGPHY_TIMING, &config->p_timing);
> -	set_reg(priv, REGPHY_CAL, &config->p_cal);
> +	if (config->p_cal_present)
> +		set_reg(priv, REGPHY_CAL, &config->p_cal);
>  
>  	if (INTERACTIVE(STEP_PHY_INIT))
>  		goto start;
> @@ -804,13 +805,16 @@ start:
>  
>  	wait_operating_mode(priv, DDRCTRL_STAT_OPERATING_MODE_NORMAL);
>  
> -	debug("DDR DQS training : ");
> +	if (config->p_cal_present) {
> +		debug("DDR DQS training skipped.\n");
> +	} else {
> +		debug("DDR DQS training : ");
>  /*  8. Disable Auto refresh and power down by setting
>   *    - RFSHCTL3.dis_au_refresh = 1
>   *    - PWRCTL.powerdown_en = 0
>   *    - DFIMISC.dfiinit_complete_en = 0
>   */
> -	stm32mp1_refresh_disable(priv->ctl);
> +		stm32mp1_refresh_disable(priv->ctl);
>  
>  /*  9. Program PUBL PGCR to enable refresh during training and rank to train
>   *     not done => keep the programed value in PGCR
> @@ -818,14 +822,15 @@ start:
>  
>  /* 10. configure PUBL PIR register to specify which training step to run */
>  	/* warning : RVTRN  is not supported by this PUBL */
> -	stm32mp1_ddrphy_init(priv->phy, DDRPHYC_PIR_QSTRN);
> +		stm32mp1_ddrphy_init(priv->phy, DDRPHYC_PIR_QSTRN);
>  
>  /* 11. monitor PUB PGSR.IDONE to poll cpmpletion of training sequence */
> -	ddrphy_idone_wait(priv->phy);
> +		ddrphy_idone_wait(priv->phy);
>  
>  /* 12. set back registers in step 8 to the orginal values if desidered */
> -	stm32mp1_refresh_restore(priv->ctl, config->c_reg.rfshctl3,
> -				 config->c_reg.pwrctl);
> +		stm32mp1_refresh_restore(priv->ctl, config->c_reg.rfshctl3,
> +					 config->c_reg.pwrctl);
> +	} /* if (config->p_cal_present) */
>  
>  	/* enable uMCTL2 AXI port 0 and 1 */
>  	setbits_le32(&priv->ctl->pctrl_0, DDRCTRL_PCTRL_N_PORT_EN);
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.h b/drivers/ram/stm32mp1/stm32mp1_ddr.h
> index 52b748f3ca..4998f04439 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ddr.h
> +++ b/drivers/ram/stm32mp1/stm32mp1_ddr.h
> @@ -170,6 +170,7 @@ struct stm32mp1_ddr_config {
>  	struct stm32mp1_ddrphy_reg p_reg;
>  	struct stm32mp1_ddrphy_timing p_timing;
>  	struct stm32mp1_ddrphy_cal p_cal;
> +	bool p_cal_present;
>  };
>  
>  int stm32mp1_ddr_clk_enable(struct ddr_info *priv, u32 mem_speed);
> diff --git a/drivers/ram/stm32mp1/stm32mp1_interactive.c b/drivers/ram/stm32mp1/stm32mp1_interactive.c
> index cedf92cb5f..805c9ddaad 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_interactive.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_interactive.c
> @@ -106,7 +106,7 @@ static void stm32mp1_do_usage(void)
>  		"help                       displays help\n"
>  		"info                       displays DDR information\n"
>  		"info  <param> <val>        changes DDR information\n"
> -		"      with <param> = step, name, size or speed\n"
> +		"      with <param> = step, name, size, speed or cal\n"
>  		"freq                       displays the DDR PHY frequency in kHz\n"
>  		"freq  <freq>               changes the DDR PHY frequency\n"
>  		"param [type|reg]           prints input parameters\n"
> @@ -160,6 +160,7 @@ static void stm32mp1_do_info(struct ddr_info *priv,
>  		printf("name = %s\n", config->info.name);
>  		printf("size = 0x%x\n", config->info.size);
>  		printf("speed = %d kHz\n", config->info.speed);
> +		printf("cal = %d\n", config->p_cal_present);
>  		return;
>  	}
>  
> @@ -208,6 +209,16 @@ static void stm32mp1_do_info(struct ddr_info *priv,
>  		}
>  		return;
>  	}
> +	if (!strcmp(argv[1], "cal")) {
> +		if (strict_strtoul(argv[2], 10, &value) < 0 ||
> +		    (value != 0 && value != 1)) {
> +			printf("invalid value %s\n", argv[2]);
> +		} else {
> +			config->p_cal_present = value;
> +			printf("cal = %d\n", config->p_cal_present);
> +		}
> +		return;
> +	}
>  	printf("argument %s invalid\n", argv[1]);
>  }
>  
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
> index eb78f1198d..b1e593f86b 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ram.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
> @@ -65,18 +65,22 @@ static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
>  	struct clk axidcg;
>  	struct stm32mp1_ddr_config config;
>  
> -#define PARAM(x, y) \
> -	{ x,\
> -	  offsetof(struct stm32mp1_ddr_config, y),\
> -	  sizeof(config.y) / sizeof(u32)}
> +#define PARAM(x, y, z)							\
> +	{	.name = x,						\
> +		.offset = offsetof(struct stm32mp1_ddr_config, y),	\
> +		.size = sizeof(config.y) / sizeof(u32),			\
> +		.present = z,						\
> +	}
>  
> -#define CTL_PARAM(x) PARAM("st,ctl-"#x, c_##x)
> -#define PHY_PARAM(x) PARAM("st,phy-"#x, p_##x)
> +#define CTL_PARAM(x) PARAM("st,ctl-"#x, c_##x, NULL)
> +#define PHY_PARAM(x) PARAM("st,phy-"#x, p_##x, NULL)
> +#define PHY_PARAM_OPT(x) PARAM("st,phy-"#x, p_##x, &config.p_##x##_present)
>  
>  	const struct {
>  		const char *name; /* name in DT */
>  		const u32 offset; /* offset in config struct */
>  		const u32 size;   /* size of parameters */
> +		bool * const present;  /* presence indication for opt */
>  	} param[] = {
>  		CTL_PARAM(reg),
>  		CTL_PARAM(timing),
> @@ -84,7 +88,7 @@ static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
>  		CTL_PARAM(perf),
>  		PHY_PARAM(reg),
>  		PHY_PARAM(timing),
> -		PHY_PARAM(cal)
> +		PHY_PARAM_OPT(cal)
>  	};
>  
>  	config.info.speed = dev_read_u32_default(dev, "st,mem-speed", 0);
> @@ -103,11 +107,25 @@ static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
>  					 param[idx].size);
>  		debug("%s: %s[0x%x] = %d\n", __func__,
>  		      param[idx].name, param[idx].size, ret);
> -		if (ret) {
> +		if (ret &&
> +		    (ret != -FDT_ERR_NOTFOUND || !param[idx].present)) {
>  			pr_err("%s: Cannot read %s, error=%d\n",
>  			       __func__, param[idx].name, ret);
>  			return -EINVAL;
>  		}
> +		if (param[idx].present) {
> +			/* save presence of optional parameters */
> +			*param[idx].present = true;
> +			if (ret == -FDT_ERR_NOTFOUND) {
> +				*param[idx].present = false;
> +#ifdef CONFIG_STM32MP1_DDR_INTERACTIVE
> +				/* reset values if used later */
> +				memset((void *)((u32)&config +
> +						param[idx].offset),
> +					0, param[idx].size * sizeof(u32));
> +#endif
> +			}
> +		}
>  	}
>  
>  	ret = clk_get_by_name(dev, "axidcg", &axidcg);

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
