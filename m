Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F12111A7BB4
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:05:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAD40C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:05:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE392C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:05:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED39bx030554; Tue, 14 Apr 2020 15:05:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=p9ZsX88VgILj5cmNY33S6k+RhIDkSwJYamXeoao0gzs=;
 b=pnJ08HGzX1a87FxN73uPaZgOU51CRTdugsVRwnoLDNpF0AsFSUlPyZfkk6hMsoBBrswQ
 fENwVrf/C8bd+LelCM9uTnsIzG9M+Prxj3bEobV1/rSjSelhV/qKLsNM72erFgROhRiw
 8HZHx8ps7gD9qqI5GYaz+VJt7YT0jjCOh+TONzKg5JvX6j+U/VvuretmnmHapAqLC0pz
 fwh9e0ST0AGVviDuZpJBllzHSH/STAnkXoszEl+Evf1jhxaDzG4IaxhwxWhrCog3oZg7
 Bgkj9xfJUqow0DIbdgcLjhb4RHOJp+LP5TtL0vE1nBFV1svRY9Pn7q481wr2GtVrj1Gv Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5stdt89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:05:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A4D310002A;
 Tue, 14 Apr 2020 15:05:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5EA0F2B5C4C;
 Tue, 14 Apr 2020 15:05:23 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:05:23 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:05:23 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 07/18] stm32mp: stm32prog: add support of boot partition
 for eMMC device
Thread-Index: AQHV/P6+0aOEyQYSgEez8F0XLDBBvqh4nzEA
Date: Tue, 14 Apr 2020 13:05:23 +0000
Message-ID: <fefa346b-42e5-9492-37ee-395b218a073a@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-8-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-8-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <9C7950B82F948A4686E1A055354848EF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 07/18] stm32mp: stm32prog: add support of
 boot partition for eMMC device
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

On 3/18/20 9:24 AM, Patrick Delaunay wrote:
> Add support of eMMC device boot partition with
> part_id = -1 for offset="boot1"
>      or = -2 for offset="boot2"
>
> The stm32prog command configures the MMC DFU backend with "mmcpart"
> and configure the eMMC (command "mmc bootbus" and "mmc partconf")
> when the update is done.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 124 +++++++++++++-----
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   2 +-
>  2 files changed, 90 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index feb83670b5..f63036606e 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -259,12 +259,30 @@ static int parse_offset(struct stm32prog_data *data,
>  	char *tail;
>  
>  	part->part_id = 0;
> +	part->addr = 0;
>  	part->size = 0;
> -	part->addr = simple_strtoull(p, &tail, 0);
> -	if (tail == p || *tail != '\0') {
> -		stm32prog_err("Layout line %d: invalid offset '%s'",
> -			      i, p);
> -		result = -EINVAL;
> +	/* eMMC boot parttion */
> +	if (!strncmp(p, "boot", 4)) {
> +		if (strlen(p) != 5) {
> +			result = -EINVAL;
> +		} else {
> +			if (p[4] == '1')
> +				part->part_id = -1;
> +			else if (p[4] == '2')
> +				part->part_id = -2;
> +			else
> +				result = -EINVAL;
> +		}
> +		if (result)
> +			stm32prog_err("Layout line %d: invalid part '%s'",
> +				      i, p);
> +	} else {
> +		part->addr = simple_strtoull(p, &tail, 0);
> +		if (tail == p || *tail != '\0') {
> +			stm32prog_err("Layout line %d: invalid offset '%s'",
> +				      i, p);
> +			result = -EINVAL;
> +		}
>  	}
>  
>  	return result;
> @@ -451,7 +469,10 @@ static int __init part_cmp(void *priv, struct list_head *a, struct list_head *b)
>  	parta = container_of(a, struct stm32prog_part_t, list);
>  	partb = container_of(b, struct stm32prog_part_t, list);
>  
> -	return parta->addr > partb->addr ? 1 : -1;
> +	if (parta->part_id != partb->part_id)
> +		return parta->part_id - partb->part_id;
> +	else
> +		return parta->addr > partb->addr ? 1 : -1;
>  }
>  
>  static int init_device(struct stm32prog_data *data,
> @@ -520,44 +541,53 @@ static int init_device(struct stm32prog_data *data,
>  				 part->dev_id, part->addr, part->size);
>  			continue;
>  		}
> -
> -		part->part_id = part_id++;
> -
> -		/* last partition : size to the end of the device */
> -		if (part->list.next != &dev->part_list) {
> -			next_part =
> -				container_of(part->list.next,
> -					     struct stm32prog_part_t,
> -					     list);
> -			if (part->addr < next_part->addr) {
> -				part->size = next_part->addr -
> -					     part->addr;
> +		if (part->part_id < 0) { /* boot hw partition for eMMC */
> +			if (mmc) {
> +				part->size = mmc->capacity_boot;
>  			} else {
> -				stm32prog_err("%s (0x%x): same address : 0x%llx == %s (0x%x): 0x%llx",
> +				stm32prog_err("%s (0x%x): hw partition not expected : %d",
>  					      part->name, part->id,
> -					      part->addr,
> -					      next_part->name,
> -					      next_part->id,
> -					      next_part->addr);
> -				return -EINVAL;
> +					      part->part_id);
> +				return -ENODEV;
>  			}
>  		} else {
> -			if (part->addr <= last_addr) {
> -				part->size = last_addr - part->addr;
> +			part->part_id = part_id++;
> +
> +			/* last partition : size to the end of the device */
> +			if (part->list.next != &dev->part_list) {
> +				next_part =
> +					container_of(part->list.next,
> +						     struct stm32prog_part_t,
> +						     list);
> +				if (part->addr < next_part->addr) {
> +					part->size = next_part->addr -
> +						     part->addr;
> +				} else {
> +					stm32prog_err("%s (0x%x): same address : 0x%llx == %s (0x%x): 0x%llx",
> +						      part->name, part->id,
> +						      part->addr,
> +						      next_part->name,
> +						      next_part->id,
> +						      next_part->addr);
> +					return -EINVAL;
> +				}
>  			} else {
> -				stm32prog_err("%s (0x%x): invalid address 0x%llx (max=0x%llx)",
> +				if (part->addr <= last_addr) {
> +					part->size = last_addr - part->addr;
> +				} else {
> +					stm32prog_err("%s (0x%x): invalid address 0x%llx (max=0x%llx)",
> +						      part->name, part->id,
> +						      part->addr, last_addr);
> +					return -EINVAL;
> +				}
> +			}
> +			if (part->addr < first_addr) {
> +				stm32prog_err("%s (0x%x): invalid address 0x%llx (min=0x%llx)",
>  					      part->name, part->id,
> -					      part->addr, last_addr);
> +					      part->addr, first_addr);
>  				return -EINVAL;
>  			}
>  		}
> -		if (part->addr < first_addr) {
> -			stm32prog_err("%s (0x%x): invalid address 0x%llx (min=0x%llx)",
> -				      part->name, part->id,
> -				      part->addr, first_addr);
> -			return -EINVAL;
> -		}
> -
>  		if ((part->addr & ((u64)part->dev->erase_size - 1)) != 0) {
>  			stm32prog_err("%s (0x%x): not aligned address : 0x%llx on erase size 0x%x",
>  				      part->name, part->id, part->addr,
> @@ -657,6 +687,9 @@ static int create_partitions(struct stm32prog_data *data)
>  		memset(buf, 0, buflen);
>  
>  		list_for_each_entry(part, &data->dev[i].part_list, list) {
> +			/* skip eMMC boot partitions */
> +			if (part->part_id < 0)
> +				continue;
>  			/* skip Raw Image */
>  			if (part->part_type == RAW_IMAGE)
>  				continue;
> @@ -787,6 +820,14 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
>  			dfu_size = part->size;
>  		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
>  				   "raw 0x0 0x%llx", dfu_size);
> +	} else if (part->part_id < 0) {
> +		u64 nb_blk = part->size / part->dev->mmc->read_bl_len;
> +
> +		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
> +				   "raw 0x%llx 0x%llx",
> +				   part->addr, nb_blk);
> +		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
> +				   " mmcpart %d;", -(part->part_id));
>  	} else {
>  		offset += snprintf(buf + offset,
>  				   ALT_BUF_LEN - offset,
> @@ -908,6 +949,19 @@ static void stm32prog_end_phase(struct stm32prog_data *data)
>  
>  	if (!data->cur_part)
>  		return;
> +
> +	if (CONFIG_IS_ENABLED(MMC) &&
> +	    data->cur_part->part_id < 0) {
> +		char cmdbuf[60];
> +
> +		sprintf(cmdbuf, "mmc bootbus %d 0 0 0; mmc partconf %d 1 %d 0",
> +			data->cur_part->dev_id, data->cur_part->dev_id,
> +			-(data->cur_part->part_id));
> +		if (run_command(cmdbuf, 0)) {
> +			stm32prog_err("commands '%s' failed", cmdbuf);
> +			return;
> +		}
> +	}
>  }
>  
>  void stm32prog_do_reset(struct stm32prog_data *data)
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 228a25d37f..6c3ad56a38 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -89,7 +89,7 @@ struct stm32prog_part_t {
>  
>  	/* information on associated device */
>  	struct stm32prog_dev_t	*dev;		/* pointer to device */
> -	u16			part_id;	/* partition id in device */
> +	s16			part_id;	/* partition id in device */
>  	int			alt_id;		/* alt id in usb/dfu */
>  
>  	struct list_head	list;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
