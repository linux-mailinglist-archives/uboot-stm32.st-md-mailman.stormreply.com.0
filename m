Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4360F65BFFA
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 13:37:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08731C64110;
	Tue,  3 Jan 2023 12:37:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DE74C03FC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 12:37:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303AUg9O021722
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 3 Jan 2023 13:37:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=v8F98QdguD7HXgXMXrkB8/fQ8DF/DFrSilNAOoyAy4U=;
 b=YCMGPFtavelfbwIRPWoq39b6zA2u6kNXh/lxZZvsuQXiS/UpocuXmvpFZ4Wa39SctGog
 78awJ2i+QOteCV9jIub8gjOniIUbkk0KAhH07wHwPQNxX4W29OTTT9usueYBMfmyzZOI
 sK12aBk0JAXk7XIjQkoSMg1vO1sYGSxXp9naOX6dAOCbWoFW0ukgAAy/pycyh4PuqMoE
 xCgCdGZzMEHUfJNy/W+F+HvvaHWhvF65eMTBNH8KDiDG2NeP81+JuVMfq6GodIYIj77O
 qK+VO8JOZttFU4byjAwFFUlMhkajPeL+C3UYNzxLov94gTz93AnOTahDXaTK39U9aNr1 BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtcupn33y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 03 Jan 2023 13:37:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5ECBA100034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 13:37:28 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53F3021BF49
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 13:37:28 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 13:37:25 +0100
Message-ID: <1ca70846-0e9a-3a96-8d58-6545306bd9dc@foss.st.com>
Date: Tue, 3 Jan 2023 13:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
 <a08c4f80-677a-eba1-7180-7b7e2de6d8de@seco.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <a08c4f80-677a-eba1-7180-7b7e2de6d8de@seco.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_04,2023-01-03_02,2022-06-22_01
Subject: Re: [Uboot-stm32] [PATCH] fastboot: remove #ifdef CONFIG when it is
	possible
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

On 12/15/22 16:40, Sean Anderson wrote:
> On 12/15/22 04:15, Patrick Delaunay wrote:
>> Much of the fastboot code predates the introduction of Kconfig and
>> has quite a few #ifdefs in it which is unnecessary now that we can use
>> IS_ENABLED() et al.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>   cmd/fastboot.c                  |  35 +++++------
>>   drivers/fastboot/fb_command.c   | 104 ++++++++++++--------------------
>>   drivers/fastboot/fb_common.c    |  11 ++--
>>   drivers/fastboot/fb_getvar.c    |  49 ++++++---------
>>   drivers/usb/gadget/f_fastboot.c |   7 +--
>>   include/fastboot.h              |  13 ----
>>   net/fastboot.c                  |   8 +--
>>   7 files changed, 82 insertions(+), 145 deletions(-)
>>
>> diff --git a/cmd/fastboot.c b/cmd/fastboot.c
>> index b498e4b22bb3..b94dbd548843 100644
>> --- a/cmd/fastboot.c
>> +++ b/cmd/fastboot.c
>> @@ -19,8 +19,14 @@
>>   static int do_fastboot_udp(int argc, char *const argv[],
>>   			   uintptr_t buf_addr, size_t buf_size)
>>   {
>> -#if CONFIG_IS_ENABLED(UDP_FUNCTION_FASTBOOT)
>> -	int err = net_loop(FASTBOOT);
>> +	int err;
>> +
>> +	if (!CONFIG_IS_ENABLED(UDP_FUNCTION_FASTBOOT)) {
>> +		pr_err("Fastboot UDP not enabled\n");
>> +		return CMD_RET_FAILURE;
>> +	}
>> +
>> +	err = net_loop(FASTBOOT);
>>   
>>   	if (err < 0) {
>>   		printf("fastboot udp error: %d\n", err);
>> @@ -28,21 +34,21 @@ static int do_fastboot_udp(int argc, char *const argv[],
>>   	}
>>   
>>   	return CMD_RET_SUCCESS;
>> -#else
>> -	pr_err("Fastboot UDP not enabled\n");
>> -	return CMD_RET_FAILURE;
>> -#endif
>>   }
>>   
>>   static int do_fastboot_usb(int argc, char *const argv[],
>>   			   uintptr_t buf_addr, size_t buf_size)
>>   {
>> -#if CONFIG_IS_ENABLED(USB_FUNCTION_FASTBOOT)
>>   	int controller_index;
>>   	char *usb_controller;
>>   	char *endp;
>>   	int ret;
>>   
>> +	if (!CONFIG_IS_ENABLED(USB_FUNCTION_FASTBOOT)) {
>> +		pr_err("Fastboot USB not enabled\n");
>> +		return CMD_RET_FAILURE;
>> +	}
>> +
>>   	if (argc < 2)
>>   		return CMD_RET_USAGE;
>>   
>> @@ -88,10 +94,6 @@ exit:
>>   	g_dnl_clear_detach();
>>   
>>   	return ret;
>> -#else
>> -	pr_err("Fastboot USB not enabled\n");
>> -	return CMD_RET_FAILURE;
>> -#endif
>>   }
>>   
>>   static int do_fastboot(struct cmd_tbl *cmdtp, int flag, int argc,
>> @@ -148,17 +150,12 @@ NXTARG:
>>   	return do_fastboot_usb(argc, argv, buf_addr, buf_size);
>>   }
>>   
>> -#ifdef CONFIG_SYS_LONGHELP
>> -static char fastboot_help_text[] =
>> +U_BOOT_CMD(
>> +	fastboot, CONFIG_SYS_MAXARGS, 1, do_fastboot,
>> +	"run as a fastboot usb or udp device",
>>   	"[-l addr] [-s size] usb <controller> | udp\n"
>>   	"\taddr - address of buffer used during data transfers ("
>>   	__stringify(CONFIG_FASTBOOT_BUF_ADDR) ")\n"
>>   	"\tsize - size of buffer used during data transfers ("
>>   	__stringify(CONFIG_FASTBOOT_BUF_SIZE) ")"
>> -	;
>> -#endif
>> -
>> -U_BOOT_CMD(
>> -	fastboot, CONFIG_SYS_MAXARGS, 1, do_fastboot,
>> -	"run as a fastboot usb or udp device", fastboot_help_text
>>   );
>> diff --git a/drivers/fastboot/fb_command.c b/drivers/fastboot/fb_command.c
>> index bdfdf262c8a3..f0fd605854da 100644
>> --- a/drivers/fastboot/fb_command.c
>> +++ b/drivers/fastboot/fb_command.c
>> @@ -31,27 +31,16 @@ static u32 fastboot_bytes_expected;
>>   static void okay(char *, char *);
>>   static void getvar(char *, char *);
>>   static void download(char *, char *);
>> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>>   static void flash(char *, char *);
>>   static void erase(char *, char *);
>> -#endif
>>   static void reboot_bootloader(char *, char *);
>>   static void reboot_fastbootd(char *, char *);
>>   static void reboot_recovery(char *, char *);
>> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT)
>>   static void oem_format(char *, char *);
>> -#endif
>> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
>>   static void oem_partconf(char *, char *);
>> -#endif
>> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
>>   static void oem_bootbus(char *, char *);
>> -#endif
>> -
>> -#if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
>>   static void run_ucmd(char *, char *);
>>   static void run_acmd(char *, char *);
>> -#endif
>>   
>>   static const struct {
>>   	const char *command;
>> @@ -65,16 +54,14 @@ static const struct {
>>   		.command = "download",
>>   		.dispatch = download
>>   	},
>> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>>   	[FASTBOOT_COMMAND_FLASH] =  {
>>   		.command = "flash",
>> -		.dispatch = flash
>> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_FLASH, (flash), (NULL))
>>   	},
>>   	[FASTBOOT_COMMAND_ERASE] =  {
>>   		.command = "erase",
>> -		.dispatch = erase
>> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_FLASH, (erase), (NULL))
>>   	},
>> -#endif
>>   	[FASTBOOT_COMMAND_BOOT] =  {
>>   		.command = "boot",
>>   		.dispatch = okay
>> @@ -103,34 +90,26 @@ static const struct {
>>   		.command = "set_active",
>>   		.dispatch = okay
>>   	},
>> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT)
>>   	[FASTBOOT_COMMAND_OEM_FORMAT] = {
>>   		.command = "oem format",
>> -		.dispatch = oem_format,
>> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT, (oem_format), (NULL))
>>   	},
>> -#endif
>> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
>>   	[FASTBOOT_COMMAND_OEM_PARTCONF] = {
>>   		.command = "oem partconf",
>> -		.dispatch = oem_partconf,
>> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF, (oem_partconf), (NULL))
>>   	},
>> -#endif
>> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
>>   	[FASTBOOT_COMMAND_OEM_BOOTBUS] = {
>>   		.command = "oem bootbus",
>> -		.dispatch = oem_bootbus,
>> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS, (oem_bootbus), (NULL))
>>   	},
>> -#endif
>> -#if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
>>   	[FASTBOOT_COMMAND_UCMD] = {
>>   		.command = "UCmd",
>> -		.dispatch = run_ucmd,
>> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPOR_______________________________________________
>> Uboot-stm32 mailing list
>> Uboot-stm32@st-md-mailman.stormreply.com
>> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
>> T, (run_ucmd), (NULL))
>>   	},
>>   	[FASTBOOT_COMMAND_ACMD] = {
>>   		.command = "ACmd",
>> -		.dispatch = run_acmd,
>> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT, (run_acmd), (NULL))
>>   	},
>> -#endif
> Does this affect binary size?


Yes the size of U-Boot binary with FastBoot option is increasing with 
this patch.


because "commands[FASTBOOT_COMMAND_COUNT]"

have always the max size for known commands in U-Boot,

even for not supported commands when .dispatch ops is NULL,

and it is detected dynamically in fastboot_handle_command()

with the added trace "command %s not supported."


I don't found a better solution because in include/fastboot.h

I remove the ifdef for FASTBOOT_COMMAND_COUNT definition


Today it is not blocking, the CI build are ok,

I hope it is not a blocking problem.


>
>>   };
>>   
>>   /**
>> @@ -156,7 +135,9 @@ int fastboot_handle_command(char *cmd_string, char *response)
>>   							response);
>>   				return i;
>>   			} else {
>> -				break;
>> +				pr_err("command %s not supported.\n", cmd_string);
>> +				fastboot_fail("Unsupported command", response);
>> +				return -1;
>>   			}
>>   		}
>>   	}
>> @@ -299,7 +280,6 @@ void fastboot_data_complete(char *response)
>>   	fastboot_bytes_received = 0;
>>   }
>>   


....


>>   
>> diff --git a/include/fastboot.h b/include/fastboot.h
>> index 57daaf129821..d062a3469ef9 100644
>> --- a/include/fastboot.h
>> +++ b/include/fastboot.h
>> @@ -24,10 +24,8 @@
>>   enum {
>>   	FASTBOOT_COMMAND_GETVAR = 0,
>>   	FASTBOOT_COMMAND_DOWNLOAD,
>> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>>   	FASTBOOT_COMMAND_FLASH,
>>   	FASTBOOT_COMMAND_ERASE,
>> -#endif
>>   	FASTBOOT_COMMAND_BOOT,
>>   	FASTBOOT_COMMAND_CONTINUE,
>>   	FASTBOOT_COMMAND_REBOOT,
>> @@ -35,20 +33,11 @@ enum {
>>   	FASTBOOT_COMMAND_REBOOT_FASTBOOTD,
>>   	FASTBOOT_COMMAND_REBOOT_RECOVERY,
>>   	FASTBOOT_COMMAND_SET_ACTIVE,
>> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT)
>>   	FASTBOOT_COMMAND_OEM_FORMAT,
>> -#endif
>> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
>>   	FASTBOOT_COMMAND_OEM_PARTCONF,
>> -#endif
>> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
>>   	FASTBOOT_COMMAND_OEM_BOOTBUS,
>> -#endif
>> -#if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
>>   	FASTBOOT_COMMAND_ACMD,
>>   	FASTBOOT_COMMAND_UCMD,
>> -#endif
>> -
>>   	FASTBOOT_COMMAND_COUNT
>>   };
>>   
>> @@ -173,7 +162,5 @@ void fastboot_data_download(const void *fastboot_data,
>>    */
>>   void fastboot_data_complete(char *response);
>>   
>> -#if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
>>   void fastboot_acmd_complete(void);
>> -#endif
>>   #endif /* _FASTBOOT_H_ */
>> diff --git a/net/fastboot.c b/net/fastboot.c
>> index 139233b86c61..96bdf5486fa6 100644
>> --- a/net/fastboot.c
>> +++ b/net/fastboot.c
>> @@ -42,7 +42,6 @@ static int fastboot_our_port;
>>   
>>   static void boot_downloaded_image(void);
>>   
>> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>>   /**
>>    * fastboot_udp_send_info() - Send an INFO packet during long commands.
>>    *
>> @@ -104,7 +103,6 @@ static void fastboot_timed_send_info(const char *msg)
>>   		fastboot_udp_send_info(msg);
>>   	}
>>   }
>> -#endif
>>   
>>   /**
>>    * fastboot_send() - Sends a packet in response to received fastboot packet
>> @@ -309,9 +307,9 @@ void fastboot_start_server(void)
>>   
>>   	fastboot_our_port = CONFIG_UDP_FUNCTION_FASTBOOT_PORT;
>>   
>> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>> -	fastboot_set_progress_callback(fastboot_timed_send_info);
>> -#endif
>> +	if (CONFIG_IS_ENABLED(FASTBOOT_FLASH))
>> +		fastboot_set_progress_callback(fastboot_timed_send_info);
>> +
>>   	net_set_udp_handler(fastboot_handler);
>>   
>>   	/* zero out server ether in case the server ip has changed */
> Reviewed-by: Sean Anderson <sean.anderson@seco.com>

regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
