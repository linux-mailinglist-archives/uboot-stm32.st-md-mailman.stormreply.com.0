Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B022338D11
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:28:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26670C57196;
	Fri, 12 Mar 2021 12:28:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD618C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:28:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CCNYFL002958; Fri, 12 Mar 2021 13:28:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=IZ/6Zev12tp+HgROTqV0IhBekDzsQXKMoR18yNDeu5I=;
 b=y9RqrXZmpAufytiYaRZoVYMPnnhciffv8Juz0UzbXKO1je9Z91Bt1lzwXiaXF2YrhsxH
 HA9fjGtAPVNtGSG4NIwRZupFRAkakOpm3mvicwS1qm42uIYwsUOdTJsgweBC5KQMuegx
 wkg5DXxNo6dRcmjdccLpIWQn8RwgNNwl3tS2W1nLF+fZiJcVjMGp36RMO1OBabeLx+3X
 jKsSITcqEJlxap8kep7WWvjBClYpgN1sl63VQgyiPGfUdZ6+UYVJrAMHRGxg+ItrH3hB
 xi/sTovMmQ6krNyoX4GEIx0j71fwta3Sq0vSDLWXRxUO+g/xWA2x+FX5jpVjlZQPI/nO 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gq53a4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:28:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 74BE810002A;
 Fri, 12 Mar 2021 13:28:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B60623DCC4;
 Fri, 12 Mar 2021 13:28:23 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:28:22 +0100
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210225133652.1.I2edaac51f69d6eb9e62ab7aeb01a3f352a364af5@changeid>
 <20210225133652.4.I05f314a38edb990c76933a71b0d050e386c6926e@changeid>
 <e0326105-43e7-08fe-3c70-d83ca6400abc@foss.st.com>
Message-ID: <95b99435-834a-753b-6cd0-720197332df4@foss.st.com>
Date: Fri, 12 Mar 2021 13:28:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e0326105-43e7-08fe-3c70-d83ca6400abc@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] stm32mp: stm32prog: replace alias by
 serial device sequence number
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

On 3/9/21 2:14 PM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 2/25/21 1:37 PM, Patrick Delaunay wrote:
>> The command "stm32prog serial <dev>" can directly use the device sequence
>> number of serial uclass as this sequence number is egual to alias when it
>> exist; this assumption simplify the code and avoid access to gd->fdt_blob
>> and the device tree parsing.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  .../cmd_stm32prog/stm32prog_serial.c          | 29 ++++---------------
>>  arch/arm/mach-stm32mp/cpu.c                   | 11 +++----
>>  2 files changed, 10 insertions(+), 30 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
>> index 373ca20886..a51e5e3ec8 100644
>> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
>> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
>> @@ -187,36 +187,19 @@ static int stm32prog_read(struct stm32prog_data *data, u8 phase, u32 offset,
>>  int stm32prog_serial_init(struct stm32prog_data *data, int link_dev)
>>  {
>>  	struct udevice *dev = NULL;
>> -	int node;
>> -	char alias[10];
>> -	const char *path;
>>  	struct dm_serial_ops *ops;
>>  	/* no parity, 8 bits, 1 stop */
>>  	u32 serial_config = SERIAL_DEFAULT_CONFIG;
>>  
>>  	down_serial_dev = NULL;
>>  
>> -	sprintf(alias, "serial%d", link_dev);
>> -	path = fdt_get_alias(gd->fdt_blob, alias);
>> -	if (!path) {
>> -		log_err("%s alias not found", alias);
>> -		return -ENODEV;
>> -	}
>> -	node = fdt_path_offset(gd->fdt_blob, path);
>> -	if (!uclass_get_device_by_of_offset(UCLASS_SERIAL, node,
>> -					    &dev)) {
>> -		down_serial_dev = dev;
>> -	} else if (node > 0 &&
>> -		   !lists_bind_fdt(gd->dm_root, offset_to_ofnode(node),
>> -				   &dev, false)) {
>> -		if (!device_probe(dev))
>> -			down_serial_dev = dev;
>> -	}
>> -	if (!down_serial_dev) {
>> -		log_err("%s = %s device not found", alias, path);
>> +	if (uclass_get_device_by_seq(UCLASS_SERIAL, link_dev, &dev)) {
>> +		log_err("serial %d device not found\n", link_dev);
>>  		return -ENODEV;
>>  	}
>>  
>> +	down_serial_dev = dev;
>> +
>>  	/* force silent console on uart only when used */
>>  	if (gd->cur_serial_dev == down_serial_dev)
>>  		gd->flags |= GD_FLG_DISABLE_CONSOLE | GD_FLG_SILENT;
>> @@ -226,11 +209,11 @@ int stm32prog_serial_init(struct stm32prog_data *data, int link_dev)
>>  	ops = serial_get_ops(down_serial_dev);
>>  
>>  	if (!ops) {
>> -		log_err("%s = %s missing ops", alias, path);
>> +		log_err("serial %d = %s missing ops\n", link_dev, dev->name);
>>  		return -ENODEV;
>>  	}
>>  	if (!ops->setconfig) {
>> -		log_err("%s = %s missing setconfig", alias, path);
>> +		log_err("serial %d = %s missing setconfig\n", link_dev, dev->name);
>>  		return -ENODEV;
>>  	}
>>  
>> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
>> index 527b6290de..9a76b5633b 100644
>> --- a/arch/arm/mach-stm32mp/cpu.c
>> +++ b/arch/arm/mach-stm32mp/cpu.c
>> @@ -466,7 +466,6 @@ static void setup_boot_mode(void)
>>  	unsigned int instance = (boot_mode & TAMP_BOOT_INSTANCE_MASK) - 1;
>>  	u32 forced_mode = (boot_ctx & TAMP_BOOT_FORCED_MASK);
>>  	struct udevice *dev;
>> -	int alias;
>>  
>>  	log_debug("%s: boot_ctx=0x%x => boot_mode=%x, instance=%d forced=%x\n",
>>  		  __func__, boot_ctx, boot_mode, instance, forced_mode);
>> @@ -474,20 +473,18 @@ static void setup_boot_mode(void)
>>  	case BOOT_SERIAL_UART:
>>  		if (instance > ARRAY_SIZE(serial_addr))
>>  			break;
>> -		/* serial : search associated alias in devicetree */
>> +		/* serial : search associated node in devicetree */
>>  		sprintf(cmd, "serial@%x", serial_addr[instance]);
>> -		if (uclass_get_device_by_name(UCLASS_SERIAL, cmd, &dev) ||
>> -		    fdtdec_get_alias_seq(gd->fdt_blob, "serial",
>> -					 dev_of_offset(dev), &alias)) {
>> +		if (uclass_get_device_by_name(UCLASS_SERIAL, cmd, &dev)) {
>>  			/* restore console on error */
>>  			if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL))
>>  				gd->flags &= ~(GD_FLG_SILENT |
>>  					       GD_FLG_DISABLE_CONSOLE);
>> -			printf("serial%d = %s not found in device tree!\n",
>> +			printf("uart%d = %s not found in device tree!\n",
>>  			       instance, cmd);
>>  			break;
>>  		}
>> -		sprintf(cmd, "%d", alias);
>> +		sprintf(cmd, "%d", dev_seq(dev));
>>  		env_set("boot_device", "serial");
>>  		env_set("boot_instance", cmd);
>>  
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> 
Applied to u-boot-stm/next

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
